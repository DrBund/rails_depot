ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# SL, set ip so it works with VM, otherwise you need to start the server using "rails server -b 0.0.0.0"
require 'rails/commands/server'

module Rails
  class Server
    new_defaults = Module.new do
      def default_options
        default_host = Rails.env == 'development' ? '0.0.0.0' : '127.0.0.1'
        super.merge( Host: default_host )
      end
    end

    # Note: Module#prepend requires Ruby 2.0 or later
    prepend new_defaults
  end
end
