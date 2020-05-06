repository:
  - name: https://github.com/R0quef0rt/corebox
    rev: dev
    target: /app

directory:
  - name: duplicati
    path: /etc/duplicati
    user: media
    group: media
    mode: 650
    recurse: true
  - name: nzbget
    path: /etc/nzbget
    user: media
    group: media
    mode: 650
    recurse: true
  - name: sonarr
    path: /etc/sonarr
    user: media
    group: media
    mode: 650
    recurse: true
  - name: radarr
    path: /etc/radarr
    user: media
    group: media
    mode: 650
    recurse: true
  - name: sync
    path: /etc/sync
    user: media
    group: media
    mode: 750
    recurse: true
  - name: plex
    path: /etc/plex
    user: media
    group: media
    mode: 650
    recurse: true