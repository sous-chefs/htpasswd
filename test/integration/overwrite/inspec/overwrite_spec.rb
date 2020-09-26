describe file '/tmp/htpass_test' do
  its('content') { should_not match /^foo/ }
  its('content') { should match /^john/ }
end
