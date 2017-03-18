Ansible Role nginx
=========
[![Build Status](https://travis-ci.org/akinobu-tani/ansible-role-nginx.svg?branch=master)](https://travis-ci.org/akinobu-tani/ansible-role-nginx)

Install nginx.

Requirements
------------

none

Role Variables
--------------

### Required

``` yaml
nginx_version: 1.11.10
```

### Options

``` yaml
nginx_repo_type: mainline
nginx_delete_default_server: no
nginx_servers:
  - name: server_name
    template: templates/nginx/server_name.conf.j2
```

Dependencies
------------

none.

Example Playbook
----------------

``` yaml
- hosts: servers
  vars:
    nginx_version: 1.10.3
  roles:
    - ansible-role-nginx
```

License
-------

MIT

Author Information
------------------

[Akinobu Tani](http://github.com/akinobu-tani)
