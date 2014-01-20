#
# Cookbook Name:: htpasswd
# recipe:: build-in
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 2012, Societe Publica.
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

case node[:htpasswd][:script_lang]
when 'ruby'
  package 'ruby'
  gem_package 'htauth'
  ruby_exec = `which ruby`.chomp
  gem_bindir = `"#{ruby_exec}" -rrubygems -e 'puts Gem.bindir'`.chomp
  link "#{gem_bindir}/htpasswd" do
    to "#{gem_bindir}/htpasswd-ruby"
    not_if "which htpasswd"
  end
when 'python'
  cookbook_file "#{node[:htpasswd][:install_dir]}/htpasswd" do
    source "htpasswd.py"
    mode "0755"
    owner "root"
    group "root"
  end
else
  raise "Unsupported htpasswd script version: #{node[:htpasswd][:script_lang]}"
end
