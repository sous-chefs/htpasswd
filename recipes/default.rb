#
# Cookbook:: htpasswd
# recipe:: default
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright:: 2012, Societe Publica.
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

declare_resource(:build_essential, 'htpasswd') do
  compile_time true
end

declare_resource(:link, '/bin/install') do
  to '/usr/bin/install'
  compile_time true
  not_if { ::File.exist? '/bin/install' }
end

# Use declare_resource to ensure these happen at the very start,
# similar to how sous-chefs/postgresql does it.
# https://github.com/sous-chefs/postgresql/blob/0b0da2cd955ab550f8e0408779b926dda908dec1/libraries/sql/_connection.rb#L109

declare_resource(:chef_gem, 'htauth') do
  compile_time true
end unless gem_installed?('htauth')
