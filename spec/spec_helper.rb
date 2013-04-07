require 'devtools'
require 'status'

# Mutant monkey patch
require 'mutant'
# TODO: Remove this with newer mutant!
module Mutant
  class Matcher
    class ObjectSpace

      # Yield scope if name matches pattern
      #
      # @param [::Module,::Class] scope
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_scope(scope)
        return unless [::Module, ::Class].include?(scope.class) 
        return unless scope.name.is_a?(String)
        if @scope_name_pattern =~ scope.name 
          yield scope 
        end
      end

    end
  end
end

Devtools.init_spec_helper

require 'capybara'
require 'capybara/rspec'
module Spec
  def self.application
    @application ||= Status::Application.build_from_config_path(Pathname.new(__FILE__).parent.join('config.yml'))
  end
end

Capybara.app = Joy::Adapter::Rack.new(Spec.application)
