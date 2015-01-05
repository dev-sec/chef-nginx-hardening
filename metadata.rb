# encoding: utf-8
#
# Copyright 2014, Deutsche Telekom AG
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
#

name             "nginx-hardening"
maintainer       "Dominik Richter"
maintainer_email "dominik.richter@googlemail.com"
license          "Apache 2.0"
description      "Configures nginx hardening"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.0"

depends 'nginx', '>= 2.0.0'
depends 'openssl'

recipe 'nginx-hardening::default', 'configures nginx for hardening'
recipe 'nginx-hardening::upgrades', 'upgrades dependencies of nginx for hardening'

