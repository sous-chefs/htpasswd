module Htpasswd
  module Cookbook
    module Helpers
      private

      def fix_perms(new_resource)
        file new_resource.file do
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

      # Use the same method as sous-chefs/postgresql
      # https://github.com/sous-chefs/postgresql/blob/0b0da2cd955ab550f8e0408779b926dda908dec1/libraries/_utils.rb#L51
      #
      # Check if a given gem is installed and available for require
      #
      # @return [true, false] Gem installed result
      #
      def gem_installed?(gem_name)
        !Gem::Specification.find_by_name(gem_name).nil?
      rescue Gem::LoadError
        false
      end

      def require_htauth
        # https://github.com/sous-chefs/postgresql/blob/0b0da2cd955ab550f8e0408779b926dda908dec1/libraries/sql/_connection.rb#L131-L133
        Chef::Log.error("Missing gem 'htauth'. Use the default htpasswd recipe to install it first. These were all the found gems: #{Gem::Specification.all_names()}") unless gem_installed?('htauth')

        require 'htauth' unless defined?(::HTAuth)
      end
    end
  end
end
Chef::DSL::Recipe.include ::Htpasswd::Cookbook::Helpers
Chef::Resource.include ::Htpasswd::Cookbook::Helpers
