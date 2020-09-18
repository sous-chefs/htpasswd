name              'htpasswd'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provider for htpasswd'
source_url        'https://github.com/redguide/htpasswd'
issues_url        'https://github.com/redguide/htpasswd/issues'
chef_version      '>= 12.15'
version           '0.3.0'

gem 'htauth'

%w(
  centos
  debian
  fedora
  redhat
  ubuntu
).each do |os|
  supports os
end

depends 'poise-python'
