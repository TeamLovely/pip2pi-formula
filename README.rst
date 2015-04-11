================
pip2pi
================

Installs the ``pip2pi <https://github.com/wolever/pip2pi>_`` tools. the ``pip2tgz`` command can be run in a cronjob if needed. If so, editing the appropriate pillar is mandatory.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``pip2pi``
------------

Installs pip2pi.

.. note::

  If you are bulding python packages that require specific dependencies (i.e. psycopg requiring libpq-dev), you can add these dependencies in the ``custom-deps.sls`` file.
