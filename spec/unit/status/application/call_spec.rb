require 'spec_helper'

describe Status::Application, '#call' do
  let(:object) { described_class.new(config) }

  let(:config)   { mock('Config')                     }
  let(:response) { mock('Response')                   }
  let(:request)  { mock('Request')                    }
  let(:router)   { mock('Router', :route => response) }

  subject { object.call(request) }

  before do
    Status::Application::Router.stub(:new => router)
  end

  it 'should call Router.new' do
    Status::Application::Router.should_receive(:new).with(request).and_return(router)
    
    subject
  end

  it 'should call route' do
    router.should_receive(:route).with(object).and_return(response)
    should be(response)
  end
end
