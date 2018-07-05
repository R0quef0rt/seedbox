{% for repo in salt['pillar.get']('compose:repos', 'https://github.com/R0quef0rt/devbox') %}
{{repo}}-download-latest:
  git.latest:
    - name: {{repo}}
    - rev: dev
    - target: /app/live
    - force_checkout: True
    - force_clone: True
    - force_fetch: True
    - force_reset: True
    - depth: 1
  {% for project in salt['pillar.get']('compose:projects', '') %}
{{project}}-compose-config: 
  file.managed: 
    - template: jinja
    {% if saltenv == 'dev' %}
    - source: /app/dev/projects/{{project}}/docker-compose.tpl.yml
    - name: /app/dev/projects/{{project}}/docker-compose.yml
    {% elif saltenv == 'qa' or 'prod' %}
    - source: /app/live/projects/{{project}}/docker-compose.tpl.yml
    - name: /app/live/projects/{{project}}/docker-compose.yml
    {% endif %}
    - require:
      - git: {{repo}}-download-latest
{{project}}-compose-build:
  cmd.run:
    - name: 'docker-compose build'
    {% if saltenv == 'dev' %}
    - cwd: /app/dev/projects/{{project}}
    {% elif saltenv == 'qa' or 'prod' %}
    - cwd: /app/live/projects/{{project}}
    {% endif %}
    - require:
      - pip: compose
      - file: {{project}}-compose-config
# {{project}}-compose-push:
#   cmd.run:
#     - name: 'docker-compose push'
#     - cwd: /app/dev/projects/{{project}}
#     - require:
#       - pip: compose
#       - git: {{repo}}-download-latest
#       - cmd: {{project}}-compose-build
  {% endfor %}
{% endfor %}