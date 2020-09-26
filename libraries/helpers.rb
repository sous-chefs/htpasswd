module Htpasswd
  module Cookbook
    module Helpers
      private

      def fix_perms(new_resource)
        file new_resource.name do
          # owner new_resource.owner
          # group new_resource.group
          mode new_resource.mode
        end
      end

      def htpasswd_user_exists?(new_resource)
        !user_entry(new_resource).nil?
      end

      def htpasswd_user_set?(new_resource)
        return false if user_entry(new_resource).nil?
        if new_resource.type == 'plaintext'
          new_resource.password == user_entry(new_resource).digest
        else
          user_entry(new_resource).authenticated?(new_resource.password)
        end
      end

      def htpasswd_create(new_resource)
        require_htauth
        pf = HTAuth::PasswdFile.new(new_resource.file, HTAuth::File::CREATE)
        pf.add(new_resource.user, new_resource.password, new_resource.type)
        pf.save!
      end

      def htpasswd_add(new_resource)
        require_htauth
        pf = HTAuth::PasswdFile.new(new_resource.file)
        pf.add_or_update(new_resource.user, new_resource.password, new_resource.type)
        pf.save!
      end

      def htpasswd_delete(new_resource)
        require_htauth
        pf = HTAuth::PasswdFile.new(new_resource.file)
        pf.delete(new_resource.user)
        pf.save!
      end

      def user_entry(new_resource)
        require_htauth
        HTAuth::PasswdFile.new(new_resource.file).fetch(new_resource.user)
      rescue
        nil
      end

      def require_htauth
        require 'htauth'
      rescue LoadError
        Chef::Log.error("Missing gem 'htauth'. Use the default htpasswd recipe to install it first.")
      end
    end
  end
end
Chef::DSL::Recipe.include ::Htpasswd::Cookbook::Helpers
Chef::Resource.include ::Htpasswd::Cookbook::Helpers
