{% from "pip2pi/map.jinja" import pip2pi with context %}
{% from "pip2pi/map.jinja" import pip2tgz with context %}

pip-pip2pi:
  pip.installed:
    - name: {{ pip2pi.pkg }}
    - require:
      - pkg: python2-pip

cron-pip2tgz:
  cron.present:
    - name: {{ pip2tgz.command }} {{ pip2tgz.repository }} {{ pip2tgz.arguments }} {{pip2tgz.packages}} >> ~/pip2pi.log 2>&1
    - user: {{ pip2tgz.user }}
    - identifier: {{ pip2tgz.identifier }}
    - minute: {{ pip2tgz.minute }}
    - hour: {{ pip2tgz.hour }}
    - daymonth: {{ pip2tgz.daymonth }}
    - month: {{ pip2tgz.month }}
    - dayweek: {{ pip2tgz.dayweek }}
    - comment: {{ pip2tgz.comment }}
    - require:
      - pip: pip-pip2pi

{% if salt['pillar.get']('pip2tgz:lookup:custom_dependencies') %}
pkg-custom-dependencies:
  pkg.installed:
    - pkgs:
      {% for custom_dependency in salt['pillar.get']('pip2tgz:lookup:custom_dependencies') %}
      - {{ custom_dependency }}
      {% endfor %}
{% endif %}
