#
# Copyright:: 2014, Deutsche Telekom AG
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

require 'spec_helper'

describe 'nginx-hardening::default' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('nginx::default', described_recipe) }

  before(:each) do
    stub_command("find /etc/nginx -perm -o+r -type f -o -perm -o+w -type f | wc -l | egrep '^0$'")
  end

  # check that the recipes are executed
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
