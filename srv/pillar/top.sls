dev:
  '*':
    - prod.system
    - qa.raid
    - prod.grafana
    - prod.hugo
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.hugo
    - qa.directory
    - prod.grafana
    - prod.hugo
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.hugo
    - prod.directory
    - prod.grafana
    - prod.hugo