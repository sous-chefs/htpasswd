describe file '/tmp/htpass_test' do
  its('content') { should_not match /^admin/ }
  its('mode') { should cmp '0644' }
end
