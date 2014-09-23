#
# Cookbook Name:: htpasswd
# Provider:: htpasswd
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 20012, Societe Publica.
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

use_inline_resources if defined?(use_inline_resources)

# Support whyrun
def whyrun_supported?
  true
end

action :add do
  if user_set?
    Chef::Log.info "#{ @new_resource } already exists - nothing to do."
  else
    converge_by("Create #{ @new_resource }") do
      if ::File.exist?(new_resource.file)
        add
      else
        create
      end
    end
  end
end

action :overwrite do
  converge_by("Create #{ @new_resource }") do
    create
  end
end

action :delete do
  if user_exists?
    converge_by("Delete #{ @new_resource }") do
      delete
    end
  else
    Chef::Log.info "#{ @current_resource } doesn't exist - can't delete."
  end
end

def initialize(*args)
  super
  @run_context.include_recipe 'htpasswd::_common'
  require 'htauth'
end

private

def user_entry
  HTAuth::PasswdFile.new(new_resource.file).fetch(new_resource.user)
  rescue
    nil
end

def user_exists?
  !user_entry.nil?
end

def user_set?
  user_entry.authenticated?(new_resource.password) unless user_entry.nil?
end

#   cmd = "htpasswd -v #{file} #{user} #{password}"
#   return Mixlib::ShellOut.new(cmd).run_command.exitstatus == 0
# end

def create
  ruby_block "Creating htpasswd file #{ new_resource.file }" do
    block do
      pf = HTAuth::PasswdFile.new(new_resource.file, HTAuth::File::CREATE)
      pf.add(new_resource.user, new_resource.password, new_resource.type)
      pf.save!
    end
  end
end

def add
  ruby_block "Adding #{new_resource.user} to htpasswd file #{ new_resource.file }" do
    block do
      pf = HTAuth::PasswdFile.new(new_resource.file)
      pf.add_or_update(new_resource.user, new_resource.password, new_resource.type)
      pf.save!
    end
    only_if { ::File.exist?(new_resource.file) }
  end
end

def delete
  ruby_block "Delete #{new_resource.user} to htpasswd file #{ new_resource.file }" do
    block do
      pf = HTAuth::PasswdFile.new(new_resource.file)
      pf.delete(new_resource.user)
      pf.save!
    end
    only_if { ::File.exist?(new_resource.file) }
  end
end
