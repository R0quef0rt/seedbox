dev:
  '*':
    - dev.system
    - dev.users
    - prod.docker
qa:
  '*':
    - prod.system
    - qa.raid
    - prod.users
    - prod.docker
    - prod.firewall
    - qa.directory
prod:
  '*':
    - prod.system
    - prod.raid
    - prod.users
    - prod.docker
    - prod.firewall
    - prod.directory