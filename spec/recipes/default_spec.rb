# encoding: UTF-8
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

require_relative '../spec_helper'

describe 'nginx-hardening::default' do

  let(:chef_run) { ChefSpec::SoloRunner.converge('nginx::default', described_recipe) }

  before do
    stub_command('/usr/sbin/apache2 -t')
    stub_command("find /etc/nginx -perm -o+r -type f -o -perm -o+w -type f | wc -l | egrep '^0$'")
    stub_command('which nginx').and_return(true)
    allow(::File).to receive(:exist?).and_return(false)
    allow(::File).to receive(:exist?).with('/etc/nginx/dh2048.pem').and_return(false)
  end

  # check that the recipres are executed
  it 'default should include os-hardening recipes by default' do
    expect(chef_run).to include_recipe 'nginx-hardening::minimize_access'
  end

  it 'creates /conf.d/90.hardening.conf' do
    expect(chef_run).to create_template('/etc/nginx/conf.d/90.hardening.conf')
  end

  it 'creates dh group' do
    expect(chef_run).to run_execute('generate_dh_group')
  end
end
