default_action :add
provides :htpasswd
unified_mode true

property :file, String, name_property: true
property :user, String, required: true
property :password, String, required: [:add, :overwrite]
property :type, String,
         equal_to: %w(md5 bcrypt sha1 plaintext crypt),
         default: 'md5'
# property :owner, String, default: 'root'
# property :group, String, default: 'root'
property :mode, String, default: '0640'

action :add do
  unless htpasswd_user_set?(@new_resource)
    if ::File.exist?(new_resource.file)
      ruby_block "Add user #{@new_resource.user} in #{@new_resource.name}" do
        block do
          htpasswd_add(@new_resource)
        end
      end
    else
      ruby_block "Create user #{@new_resource.user} in #{@new_resource.name}" do
        block do
          htpasswd_create(@new_resource)
        end
      end
    end
  end
  fix_perms(new_resource)
end

action :overwrite do
  converge_by("Overwrite file #{@new_resource.name} with user #{@new_resource.user}") do
    htpasswd_create(@new_resource)
  end
  fix_perms(new_resource)
end

action :delete do
  if htpasswd_user_exists?(@new_resource)
    converge_by("Delete user #{@new_resource.user} in #{@new_resource.name}") do
      htpasswd_delete(@new_resource)
    end
  end
  fix_perms(new_resource)
end
