require 'spec_helper'

describe Status::Action, '#page_response' do
  let(:object) { class_under_test.new(application, request) }

  let(:request)     { mock('Request')     }
  let(:application) { mock('Application', :page_attributes => { :meta_description => 'THE-META-DESCRIPTION' }) }

  let(:class_under_test) do
    Class.new(described_class) do
      public :page_response
    end
  end

  let(:attributes) do
    {
      :title            => 'THE-TITLE',
      :heading          => 'THE-HEADING',
      :content          => 'THE-CONTENT'
    }
  end

  let(:expected_attributes) do
    attributes.merge(:meta_description => 'THE-META-DESCRIPTION')
  end

  subject { object.page_response(attributes) }

  its(:status) { should eql(Response::Status::OK)                                   }
  its(:body)   { should eql(Status::Context::Page.render(expected_attributes).to_s) }
end
