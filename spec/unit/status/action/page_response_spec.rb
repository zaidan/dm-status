require 'spec_helper'

describe Status::Action, '#page_response' do
  let(:object) { class_under_test.new(application, request) }

  let(:request)     { mock('Request')     }
  let(:application) { mock('Application') }

  let(:class_under_test) do
    Class.new(described_class) do
      public :page_response
    end
  end

  let(:attributes) do
    {
      :title            => 'THE-TITLE',
      :meta_description => 'THE-META-DESCRIPTION',
      :content          => 'THE-CONTENT'
    }
  end

  subject { object.page_response(attributes) }

  its(:status) { should eql(Response::Status::OK)                          }
  its(:body)   { should eql(Status::Context::Page.render(attributes).to_s) }
end
