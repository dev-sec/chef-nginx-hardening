# encoding: utf-8
#
# Cookbook Name:: nginx-hardening
# Attributes:: default
#
# Copyright 2014, Dominik Richter
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

case platform
when 'debian', 'ubuntu'
  default['nginx-hardening']['packages'] = 'nginx-extras'
else
  default['nginx-hardening']['packages'] = []
end

# security options

default['nginx']['server_tokens'] = 'off'

default['nginx']['default_site_enabled'] = false

default['nginx']['client_body_buffer_size'] = '1k'

default['nginx']['client_max_body_size'] = '1k'

default['nginx']['keepalive'] = 'on'
default['nginx']['keepalive_timeout'] = '5 5'

# default['nginx']['enable_rate_limiting'] = true
# default['nginx']['rate_limiting_zone_name'] = 'default'
# default['nginx']['rate_limiting_backoff'] = '10m'
# default['nginx']['rate_limit'] = '1r/s'

# additional security options (separate config file)

default['nginx-hardening']['options'] = {

  'more_clear_headers' => [
    '\'Server\'',
    '\'X-Powered-By\''
  ],

  'client_header_buffer_size' => '1k',

  'large_client_header_buffers' => '2 1k',

  'client_body_timeout' => '10',

  'client_header_timeout' => '10',

  'send_timeout' => '10',

  'limit_conn_zone' => '$binary_remote_addr zone=default:10m',
  'limit_conn' => 'default 5',

  'add_header' => [
    # vvoid clickjacking
    'X-Frame-Options SAMEORIGIN',

    # disable content-type sniffing
    'X-Content-Type-Options nosniff',

    # XSS filter
    'X-XSS-Protection "1; mode=block"'
  ]

}

# compilation flags (if used)

default['nginx-hardening']['source']['http_autoindex_module'] = false
default['nginx-hardening']['source']['http_ssi_module'] = false

# create the final list of flags
flags = %W(
  --prefix=#{node['nginx']['source']['prefix']}
  --conf-path=#{node['nginx']['dir']}/nginx.conf
  --sbin-path=#{node['nginx']['source']['sbin_path']}
)
flags.push '--without-http_autoindex_module' unless node['nginx-hardening']['source']['http_autoindex_module']
flags.push '--without-http_ssi_module'       unless node['nginx-hardening']['source']['http_ssi_module']

default['nginx']['source']['default_configure_flags'] = flags
