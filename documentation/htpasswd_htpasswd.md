# htpasswd Resource

Use the `htpasswd` resource to manage users in Apache htpasswd-format files.

## Actions

* `:add` - Add or update a user in an htpasswd file. Creates the file when it does not exist. This is the default action.
* `:overwrite` - Replace the htpasswd file with a single user entry.
* `:delete` - Remove a user entry from an htpasswd file when it exists.

## Properties

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | String | Resource name | Path to the htpasswd file to manage. |
| `user` | String |  | User entry to add, update, overwrite, or delete. |
| `password` | String |  | Password for `:add` and `:overwrite`. |
| `type` | String | `md5` | Password algorithm. Valid values: `md5`, `bcrypt`, `sha1`, `plaintext`, `crypt`. |
| `mode` | String | `0640` | File mode to apply after the resource changes the file. |

## Examples

Add or update a user with the default Apache MD5 type:

```ruby
htpasswd '/etc/nginx/htpassword' do
  user 'foo'
  password 'bar'
end
```

Add or update a user using SHA1:

```ruby
htpasswd '/etc/nginx/htpassword' do
  user 'foo'
  password 'bar'
  type 'sha1'
end
```

Store an already encrypted Apache MD5 password:

```ruby
htpasswd '/etc/nginx/htpassword' do
  user 'foo'
  password '$apr1$H5Z8CUB.$L3wyxUF1ZDd.oZFlTkJ4X.'
  type 'plaintext'
end
```

Delete a user:

```ruby
htpasswd '/etc/nginx/htpassword' do
  user 'foo'
  action :delete
end
```
