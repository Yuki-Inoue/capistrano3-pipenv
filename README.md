# Capistrano3::Pipenv

Pipenv tasks for capistrano3.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'capistrano3-pipenv', require: false
end
```

And then execute:

    $ bundle install

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano3/pipenv'
# If you are using pyenv
require 'capistrano3/pyenv'
```

The task will run before `deploy:updated` as part of Capistrano's default deploy, or can be run in isolation with `cap production pipenv:install`.

When you require the `capistrano3/pyenv`, the `pipenv` commands will be prefixed by `pyenv exec`.

Following are the default settings configurable in this gem.

```ruby
# for capistrano3/pipenv

set :pipenv_roles, :all
set :pipenv_servers, -> { release_roles(fetch(:pipenv_roles)) }
set :pipenv_flags, '--deploy'
set :pipenv_env_variables, {}
set :pipenv_clean_options, '--all'

# for capistrano3/pyenv
set :pyenv_path, -> {
  pyenv_path = fetch(:pyenv_custom_path)
  pyenv_path ||
    if fetch(:pyenv_type, :user) == :system
      '/usr/local/pyenv'
    else
      '$HOME/.pyenv'
    end
}
set :pyenv_roles, fetch(:pyenv_roles, :all)
set :pyenv_python_dir, -> { "#{fetch(:pyenv_path)}/versions/#{fetch(:pyenv_python)}" }
set :pyenv_map_bins, %w{pipenv}
```

## Development

In your project which uses capistrano (and this gem),
you'd probably want to try something like

```
gem 'capistrano3-pipenv', path: '/path/to/local/copy/of/this/repo'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yuki-Inoue/capistrano3-pipenv .
