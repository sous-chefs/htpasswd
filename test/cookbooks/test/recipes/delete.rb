file = '/tmp/htpass_test'

htpasswd file do
  user 'admin'
  password 'admin'
  mode '0644'
end

htpasswd file do
  user 'admin'
  action :delete
  mode '0644'
end
