name 'htpasswd'
maintainer 'Guilhem Lettron'
maintainer_email 'guilhem.lettron@youscribe.com'
license 'Apache 2.0'
description 'Provider for htpasswd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.4'
suggests 'python'

%w( ubuntu debian centos redhat fedora ).each do |os|
  supports os
end

depends 'python'
