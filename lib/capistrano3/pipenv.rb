require "capistrano3/pipenv/version"

module Capistrano3
  module Pipenv
    class Error < StandardError; end
    # Your code goes here...
  end
end

require_relative 'pipenv/tasks'
require_relative 'pipenv/hooks'
