require 'spec_helper'

describe Status::Action::Main, '#response' do
  let(:object) { described_class.new(application, request) }

  subject { object.response }

  let(:application) { Spec.application }
  let(:request)     { mock('Request')  }
  
  its(:status) { should be(Response::Status::OK) }
  its(:body) do 
    content = Status::Context::Main.render(:projects => Spec.application.projects)
    should eql(Status::Context::Page.render(Spec.application.page_attributes.merge(:content => content)).to_s)
  end
end
