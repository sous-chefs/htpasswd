# Migration

## Full Custom Resource Migration

The cookbook no longer provides a default recipe. Consumers must declare the public `htpasswd` resource directly in their own recipes.

Before:

```ruby
include_recipe 'htpasswd'

htpasswd '/etc/nginx/htpassword' do
  user 'foo'
  password 'bar'
end
```

After:

```ruby
htpasswd '/etc/nginx/htpassword' do
  user 'foo'
  password 'bar'
end
```

## Dependency Handling

The resource installs the `htauth` gem itself before managing htpasswd files. Consumers no longer need the removed cookbook default recipe for setup.

## Test Cookbook Examples

Resource usage examples now live in:

* `test/cookbooks/test/recipes/default.rb`
* `test/cookbooks/test/recipes/delete.rb`
* `test/cookbooks/test/recipes/overwrite.rb`
