actions :add, :overwrite

attribute :file, :kind_of => String, :name_attribute => true
attribute :user, :kind_of => String, :required => true
attribute :password, :kind_of => String, :required => true

def initialize(*args)
	super
	@action = :add
end
