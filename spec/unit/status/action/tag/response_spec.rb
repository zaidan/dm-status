require 'spec_helper'

describe Status::Action::Tag, '#response' do
  let(:object) { described_class.new(application, request) }

  subject { object.response }

  let(:application) { Spec.application                           }
  let(:tag)         { 'tag1'                                     }
  let(:get)         { { 'tag' => tag }                           }
  let(:request)     { mock('Request', :query_params_hash => get) }

  its(:status) { should be(Response::Status::OK) }
  its(:body) do
    projects = [Spec.application.projects.first]
    content = Status::Context::Main.render(:projects => projects)
    should eql(Status::Context::Page.render(Spec.application.page_attributes.merge(:content => content)).to_s)
  end
end
