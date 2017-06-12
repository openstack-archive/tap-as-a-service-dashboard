===============================
Tap-as-a-Service Dashboard
===============================

Tap-as-a-Service Horizon plugin.

* Free software: Apache license
* Source: http://git.openstack.org/cgit/openstack/tap-as-a-service-dashboard
* Bugs: http://bugs.launchpad.net/tap-as-a-service-dashboard

Features
--------

* TODO

Enabling in DevStack
--------------------

Add this repo as an external repository into your ``local.conf`` file::

    [[local|localrc]]
    enable_plugin neutron_taas_dashboard https://github.com/openstack/tap-as-a-service-dashboard

Manual Installation
-------------------

Begin by cloning the Horizon and Tap-as-a-Service Dashboard repositories::

    git clone https://github.com/openstack/horizon
    git clone https://github.com/openstack/tap-as-a-service-dashboard

Create a virtual environment and install Horizon dependencies::

    cd horizon
    python tools/install_venv.py

Set up your ``local_settings.py`` file::

    cp openstack_dashboard/local/local_settings.py.example openstack_dashboard/local/local_settings.py

Open up the copied ``local_settings.py`` file in your preferred text
editor. You will want to customize several settings:

-  ``OPENSTACK_HOST`` should be configured with the hostname of your
   OpenStack server. Verify that the ``OPENSTACK_KEYSTONE_URL`` and
   ``OPENSTACK_KEYSTONE_DEFAULT_ROLE`` settings are correct for your
   environment. (They should be correct unless you modified your
   OpenStack server to change them.)

Install Tap-as-a-Service Dashboard with all dependencies in your virtual environment::

    tools/with_venv.sh pip install -e ../tap-as-a-service-dashboard/

And enable it in Horizon::

    ln -s ../tap-as-a-service-dashboard/neutron_taas_dashboard/enabled/_90_project_taps_panelgroup.py openstack_dashboard/local/enabled
    ln -s ../tap-as-a-service-dashboard/neutron_taas_dashboard/enabled/_91_project_taps_taps_panel.py openstack_dashboard/local/enabled

To run horizon with the newly enabled Tap-as-a-Service Dashboard plugin run::

    ./run_tests.sh --runserver 0.0.0.0:8080

to have the application start on port 8080 and the horizon dashboard will be
available in your browser at http://localhost:8080/

Release Notes
=============

.. toctree::
  :glob:
  :maxdepth: 1

  releases/*

Source Code Reference
=====================

.. toctree::
  :glob:
  :maxdepth: 1

  sourcecode/autoindex


