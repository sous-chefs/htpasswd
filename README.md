Description
===========

Manage an htpasswd file.
If htpasswd exe isn't found, we install a python implementation.

Requirements
============

Work on linux with python for build-in implementation

Resource/Provider
=================

This cookbook includes LWRPs for managing:
* htpasswd

htpasswd
--------

# Actions

- :add: Add a login in a htpasswd file. modify it if there is already one and create file if not found (default)
- :overwrite: Overwrite an htpasswd file (delete file and add user).

# Attribute Parameters

- package_name: file attribute. path of the htpaswwd to manage
- user: user to create
- password: password for the user

# Example
    # add user "foo" with password "bar" to "/etc/nginx/htpassword"
    htpasswd "/etc/nginx/htpassword" do
      user "foo"
      password "bar"
    end
