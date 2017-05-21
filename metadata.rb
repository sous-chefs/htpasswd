name 'htpasswd'
maintainer 'Guilhem Lettron'
maintainer_email 'guilhem.lettron@youscribe.com'
license 'Apache-2.0'
description 'Provider for htpasswd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
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

source_url 'https://github.com/redguide/htpasswd' if respond_to?(:source_url)
issues_url 'https://github.com/redguide/htpasswd/issues' if respond_to?(:issues_url)
chef_version '>= 12.8' if respond_to?(:chef_version)

gem 'htauth'
