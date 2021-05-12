# htpasswd Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/htpasswd.svg)](https://supermarket.chef.io/cookbooks/htpasswd)
[![Build Status](https://img.shields.io/circleci/project/github/sous-chefs/htpasswd/master.svg)](https://circleci.com/gh/sous-chefs/htpasswd)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Manage users in htpasswd files.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- CentOS 7+
- Debian 9+
- Ubuntu 16.04+ LTS

### Chef Infra

This cookbook requires Chef Infra >= 15.3.

## Resource/Provider

### htpasswd

### Actions

- :add: Add a login in a htpasswd file. Update and modify it if there is already one and create file if not found (default)
- :overwrite: Overwrite an htpasswd file (delete file and add user) NOTE: This action is _not_ idempotent.
- :delete: Delete a login in a htpasswd file.

### Parameters

- :file: Path of the htpasswd to manage
- :user: User to create
- :password: Password for the user
- :type: Password algorithm to use. Valid options are: "md5", "bcrypt", "sha1", "plaintext", or "crypt". Default is
  "md5"
- :mode: File mode for the file. Default is `0640`.

### Example

```ruby
# add user "foo" with password "bar" to "/etc/nginx/htpassword" with the default md5 type.
htpasswd "/etc/nginx/htpassword" do
  user "foo"
  password "bar"
end

# add user "foo" with password "bar" using sha1 as the type.
htpasswd "/etc/nginx/htpassword" do
  user "foo"
  password "bar"
  type "sha1"
end

# add user "foo" with encrypted password using plaintext as the type.
htpasswd "/etc/nginx/htpassword" do
  user "foo"
  password "$apr1$H5Z8CUB.$L3wyxUF1ZDd.oZFlTkJ4X."
  type "plaintext"
end
```

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
