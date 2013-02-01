$: << 'lib'
require 'status'

Status.application.repositories.each do |repository|
  p repository.github_status
end
