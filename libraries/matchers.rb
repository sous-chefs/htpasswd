if defined?(ChefSpec)

  def add_htpasswd(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:htpasswd, :add, resource_name)
  end

  def overwrite_htpasswd(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:htpasswd, :overwrite, resource_name)
  end

  def delete_htpasswd(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:htpasswd, :delete, resource_name)
  end

end
