actions :add, :overwrite, :delete
default_action :add

attribute :file, :kind_of => String, :name_attribute => true
attribute :user, :kind_of => String, :required => true
attribute :password, :kind_of => String, :required => true

attr_accessor :exists
