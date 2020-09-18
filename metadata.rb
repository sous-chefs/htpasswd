name 'htpasswd'
maintainer 'Guilhem Lettron'
maintainer_email 'guilhem.lettron@youscribe.com'
license 'Apache-2.0'
description 'Provider for htpasswd'
version '0.3.0'

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

source_url 'https://github.com/redguide/htpasswd'
issues_url 'https://github.com/redguide/htpasswd/issues'
chef_version '>= 12.8'

gem 'htauth'
