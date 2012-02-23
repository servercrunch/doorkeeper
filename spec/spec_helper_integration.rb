ENV["RAILS_ENV"] ||= 'test'
DOORKEEPER_ORM = (ENV["DOORKEEPER_ORM"] || :active_record).to_sym

puts "\n==> Doorkeeper.orm = #{DOORKEEPER_ORM.inspect}"

$:.unshift File.dirname(__FILE__)

require 'dummy/config/environment'
require 'rspec/rails'
require 'rspec/autorun'
require 'generator_spec/test_case'
require 'timecop'
require 'factory_girl_rails'
require "support/orm/#{DOORKEEPER_ORM}"

Dir["#{File.dirname(__FILE__)}/support/{dependencies,helpers,shared}/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.infer_base_class_for_anonymous_controllers = false

  config.before do
    Doorkeeper.configure {}
  end
end
