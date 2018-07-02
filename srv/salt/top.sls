dev:
  '*':
    - common
    - system
    - docker
    - docker.compose
    - docker.compose-cli
qa:
  '*':
    - common
    - system
    - system.directory
    - system.firewall
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid
  'newbox':
    - docker.compose-cmd
prod:
  '*':
    - common
    - system
    - system.directory
    - system.firewall
    - docker
    - docker.compose
  'devbox':
    - docker.compose-cmd
    - system.raid
  'newbox':
    - docker.compose-cmd