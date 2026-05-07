# frozen_string_literal: true

module Htpasswd
  module Cookbook
    module Helpers
      private

      def install_htauth_gem
        build_essential 'htpasswd gem dependencies' do
          action :install
        end

        chef_gem 'htauth' do
          compile_time false
          action :install
        end
      end

      def fix_perms(new_resource)
        file new_resource.file do
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
      rescue StandardError
        nil
      end

      def require_htauth
        require 'htauth'
      rescue LoadError
        raise "Missing gem 'htauth'. The htpasswd resource installs it before managing files."
      end
    end
  end
end
