#!/usr/bin/env ruby
$: << 'lib'
require 'status'
Joy::Runner.run(Status.application)
