# frozen_string_literal: true

file = '/tmp/htpass_test'

htpasswd file do
  user 'foo'
  password 'bar'
end

htpasswd file do
  user 'john'
  password 'do'
  action :overwrite
end
