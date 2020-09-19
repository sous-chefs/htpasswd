actions :add, :overwrite, :delete
default_action :add

attribute :file, kind_of: String, name_attribute: true
attribute :user, kind_of: String, required: [:add]
attribute :password, kind_of: String, required: [:add]
attribute :type, kind_of: String, default: 'md5'

attr_accessor :exists
