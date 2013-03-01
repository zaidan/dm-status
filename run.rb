#!/usr/bin/env ruby
$: << 'lib'
require 'status'
Status::Application.build_from_config_path(Pathname(__FILE__).parent.join('config.yml'))
Joy::Runner.run(Status.application)
