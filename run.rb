#!/usr/bin/env ruby
$: << 'lib'
require 'status'
application = Status::Application.build_from_config_path(Pathname(__FILE__).parent.join('config.yml'))
Joy::Runner.run(application)
