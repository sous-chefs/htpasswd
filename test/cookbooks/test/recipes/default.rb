file = '/tmp/htpass_test'

htpasswd file do
  user 'foo'
  password 'bar'
end

htpasswd file do
  user 'jane'
  password '$apr1$PsW9V1Ij$lDqu.ixfvbG5hRN27c5Xn/'
  type 'plaintext'
end

htpasswd file do
  user 'admin'
  action :delete
end
