#    Copyright 2016, FUJITSU LABORATORIES LTD.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

from django.conf.urls import include
from django.conf.urls import url

from neutron_taas_dashboard.dashboards.project.tapservices.tapflows \
    import urls as tapflow_urls
from neutron_taas_dashboard.dashboards.project.tapservices.tapflows \
    import views as tf_views
from neutron_taas_dashboard.dashboards.project.tapservices \
    import views

TAP_SERVICES = r'^(?P<tap_service_id>[^/]+)/%s$'

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^create/$', views.CreateView.as_view(), name='create'),
    url(TAP_SERVICES % 'detail', views.DetailView.as_view(), name='detail'),
    url(TAP_SERVICES % 'tapflows/create', tf_views.CreateView.as_view(),
        name='createtapflow'),
    url(r'^tapflows/', include(tapflow_urls, namespace='tapflows')),
]
