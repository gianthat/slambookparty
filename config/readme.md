Make sure to add Capistrano to your Gemfile:

```
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'

gem 'capistrano-rbenv', github: "capistrano/rbenv"
```

Then make some additions to our Capfile to include bundler, rails, and rbenv. Edit your Capfile and add these lines:

```
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rbenv'
```
