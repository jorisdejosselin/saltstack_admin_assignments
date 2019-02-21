{% from "database/map.jinja" import defaults with context %}

{% if grains['os'] == "Debian" %}
install_Debian_pack:
  pkg.installed:
    - pkgs:
      - mysql-server
    - require_in:
      - install_base_webserverpack
{% endif %}

{% if grains['os'] == "RedHat" %}
add_repo_mysql:
  cmd.run:
    - name: |
      yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
      yum install mysql-community-server
    - require_in:
      - install_base_webserverpack
{% endif %}

install_base_databasepack:
  pkg.installed:
    - pkgs:
       - php
  service.running:
    - name: mysql-server
    - enable: True

