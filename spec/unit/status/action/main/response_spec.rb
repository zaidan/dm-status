require 'spec_helper'

describe Status::Action::Main, '#response' do
  let(:object) { described_class.new(application, request) }

  subject { object.response }

  let(:application) { mock('Application', :projects => [], :sponsors => []) }
  let(:request)     { mock('Request')     }
  
  its(:status) { should be(Response::Status::OK) }
  its(:body) do 
    content = Status::Context::Main.render(:projects => [])
    should eql(Status::Context::Page.render(:content => content).to_s)
  end
end
