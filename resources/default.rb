# frozen_string_literal: true

default_action :add
provides :htpasswd
unified_mode true

property :file, String, name_property: true
property :user, String, required: true
property :password, String, required: [:add, :overwrite]
property :type, String,
         equal_to: %w(md5 bcrypt sha1 plaintext crypt),
         default: 'md5'
property :mode, String, default: '0640'

action_class do
  include Htpasswd::Cookbook::Helpers
end

action :add do
  install_htauth_gem

  helper = self
  htpasswd_resource = new_resource

  ruby_block "add htpasswd user #{new_resource.user} to #{new_resource.file}" do
    block do
      if ::File.exist?(htpasswd_resource.file)
        helper.send(:htpasswd_add, htpasswd_resource)
      else
        helper.send(:htpasswd_create, htpasswd_resource)
      end
    end
    not_if { helper.send(:htpasswd_user_set?, htpasswd_resource) }
  end

  fix_perms(new_resource)
end

action :overwrite do
  install_htauth_gem

  helper = self
  htpasswd_resource = new_resource

  ruby_block "overwrite htpasswd file #{new_resource.file} with user #{new_resource.user}" do
    block do
      helper.send(:htpasswd_create, htpasswd_resource)
    end
  end

  fix_perms(new_resource)
end

action :delete do
  install_htauth_gem

  helper = self
  htpasswd_resource = new_resource

  ruby_block "delete htpasswd user #{new_resource.user} from #{new_resource.file}" do
    block do
      helper.send(:htpasswd_delete, htpasswd_resource)
    end
    only_if { helper.send(:htpasswd_user_exists?, htpasswd_resource) }
  end

  file new_resource.file do
    mode new_resource.mode
    only_if { ::File.exist?(new_resource.file) }
  end
end
