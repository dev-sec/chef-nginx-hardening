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

# Get required packages
Array(node['nginx-hardening']['packages']).each do |p|
  package p
end

template "#{node['nginx']['dir']}/conf.d/90.hardening.conf" do
  source "extras.conf.erb"
  variables({
    :options => NginxHardening.options( node['nginx-hardening']['options'] )
  })
end
