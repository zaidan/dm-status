require 'rspec'
require 'rspec/mocks'
require 'status'

Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require(f) }
