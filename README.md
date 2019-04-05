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

## Development

In your project which uses capistrano (and this gem),
you'd probably want to try something like

```
gem 'capistrano3-pipenv', path: '/path/to/local/copy/of/this/repo'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yuki-Inoue/capistrano3-pipenv .
