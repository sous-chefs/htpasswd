# htpasswd

[![Cookbook Version](https://img.shields.io/cookbook/v/htpasswd.svg)](https://supermarket.chef.io/cookbooks/htpasswd)
[![Build Status](https://img.shields.io/circleci/project/github/sous-chefs/htpasswd/master.svg)](https://circleci.com/gh/sous-chefs/htpasswd)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

## Description

Manage an htpasswd file.
If htpasswd exe isn't found, we install a python implementation.

## Requirements

Work on linux with python for build-in implementation

## Resource/Provider

This cookbook includes LWRPs for managing htpasswd

### Actions

- :add: Add a login in a htpasswd file. modify it if there is already one and create file if not found (default)
- :overwrite: Overwrite an htpasswd file (delete file and add user).

### Attribute Parameters

- package_name: file attribute. path of the htpaswwd to manage
- user: user to create
- password: password for the user

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
