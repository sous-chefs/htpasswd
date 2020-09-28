describe file '/tmp/htpass_test' do
  its('content') { should match /^foo:\$apr1.*/ }
  its('content') { should match %r{^jane:\$apr1\$PsW9V1Ij\$lDqu\.ixfvbG5hRN27c5Xn/} }
  its('content') { should_not match /^admin/ }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0640' }
end
