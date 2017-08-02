#!/bin/bash

# Copyright 2016 FUJITSU LABORATORIES LTD.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


function neutron_taas_dashboard_install {
    setup_develop $NEUTRON_TAAS_DASHBOARD_DIR
}

function neutron_taas_dashboard_configure {
    cp $NEUTRON_TAAS_DASHBOARD_ENABLE_FILE \
        $HORIZON_DIR/openstack_dashboard/local/enabled/

    local local_settings=$HORIZON_DIR/openstack_dashboard/local/local_settings.py
}

if is_service_enabled horizon && is_service_enabled taas; then
    if [[ "$1" == "stack" && "$2" == "install" ]]; then
        # Perform installation of service source
        echo_summary "Installing neutron-taas-dashboard"
        neutron_taas_dashboard_install
    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        echo_summary "Configuring neutron-taas-dashboard"
        neutron_taas_dashboard_configure
    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        # Initialize and start the TaaS service
        echo_summary "Initializing neutron-taas-dashboard"
    fi
fi

if [[ "$1" == "unstack" ]]; then
    # Shut down TaaS dashboard services
    :
fi

if [[ "$1" == "clean" ]]; then
    # Remove state and transient data
    # Remember clean.sh first calls unstack.sh

    # Remove taas-dashboard enabled file and pyc
    # rm -f ${NEUTRON_TAAS_DASHBOARD_ENABLE_FILE}*
    ENABLE_FILE="${NEUTRON_TAAS_DASHBOARD_ENABLE_FILE##*/}"
    rm -f ${NEUTRON_TAAS_DASHBOARD_ENABLE_FILE}/$ENABLE_FILE*
fi
