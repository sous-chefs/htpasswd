file = '/tmp/htpass_test'

htpasswd file do
  user 'admin'
  password 'admin'
end

htpasswd file do
  user 'admin'
  action :delete
end
