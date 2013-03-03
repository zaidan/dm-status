require 'spec_helper'

describe Status::Action::NotFound, '#response' do
  let(:object) { described_class.new(application, request) }
  let(:application) { mock('Application')                        }
  let(:request)     { mock('Request', :path_info => '/the/path') }

  subject { object.response }

  it_should_behave_like 'an idempotent method'

  its(:status) { should be(Response::Status::NOT_FOUND) }
end
