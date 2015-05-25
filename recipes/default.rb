# encoding: utf-8
#
# Cookbook Name:: nginx-hardening
# Recipe:: default.rb
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

include_recipe('nginx-hardening::minimize_access')

node.default['nginx-hardening']['options']['ssl_dhparam'] = ::File.join (node['nginx-hardening']['certificates_dir'] || '/etc/nginx/'), 'dh2048.pem'

options = node['nginx-hardening']['options'].to_hash

# OS-specific configuration
if platform?('ubuntu', 'debian')

  # when installing from canonical package on Ubuntu
  # we can get additional modules via extra package
  if node['nginx']['install_method'] == 'package' && node['nginx']['repo_source'].nil?
    package 'nginx-extras'
  else
    # repo and source installations have no extra modules
    # on ubuntu/debian so the affected options must be removed
    options.delete('more_clear_headers')
  end

end

if platform_family?('rhel')
  unless node['nginx']['repo_source'].nil?
    # repo and source installations have no extra modules
    # on ubuntu/debian so the affected options must be removed
    options.delete('more_clear_headers')
  end
end

template "#{node['nginx']['dir']}/conf.d/90.hardening.conf" do
  source 'extras.conf.erb'
  variables(
    options: NginxHardening.options(options)
  )
  notifies :restart, 'service[nginx]', :immediately
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
  notifies :restart, 'service[nginx]', :immediately
end

execute 'generate_dh_group' do
  command "openssl dhparam -out #{node['nginx-hardening']['options']['ssl_dhparam']} #{node['nginx-hardening']['dh-size']}"
  not_if { File.exist?(node['nginx-hardening']['options']['ssl_dhparam']) }
end

