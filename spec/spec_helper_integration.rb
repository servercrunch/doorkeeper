ENV["RAILS_ENV"] ||= 'test'
DOORKEEPER_ORM = (ENV['DOORKEEPER_ORM'] || :active_record).to_sym

$:.unshift File.dirname(__FILE__)

require 'dummy/config/environment'
require 'rspec/rails'
require 'rspec/autorun'
require 'generator_spec/test_case'
require 'timecop'
require 'factory_girl_rails'
require 'database_cleaner'

puts "\n==> Doorkeeper.orm = #{Doorkeeper.configuration.orm.inspect}"
require "support/orm/#{Doorkeeper.configuration.orm}"

Dir["#{File.dirname(__FILE__)}/support/{helpers,shared}/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.infer_base_class_for_anonymous_controllers = false

  config.before do
    DatabaseCleaner.start
    Doorkeeper.configure {
      orm DOORKEEPER_ORM
    }
  end

  config.after do
    DatabaseCleaner.clean
  end
end
