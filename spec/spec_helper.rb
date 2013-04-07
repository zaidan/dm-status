require 'devtools'
require 'status'
Devtools.init_spec_helper

require 'capybara'
require 'capybara/rspec'
module Spec
  def self.application
    @application ||= Status::Application.build_from_config_path(Pathname.new(__FILE__).parent.join('config.yml'))
  end
end

Capybara.app = Joy::Adapter::Rack.new(Spec.application)
