chef_gem 'htauth' do
  compile_time false if Chef::Resource::ChefGem.method_defined?(:compile_time)
  version '~> 1.1.0'
end
