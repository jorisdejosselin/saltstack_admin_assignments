{% from "webserver/map.jinja" import defaults with context %}

install_base_webserverpack:
  pkg.installed:
    - pkgs:
      - {{ defaults.server_apache }}
      - php
  service.running:
    - name: {{ defaults.service_apache }}
    - enable: True

