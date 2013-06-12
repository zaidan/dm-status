require 'spec_helper'

describe Status::Application::Router, '#route' do
  let(:object) { described_class.new(request) }

  let(:application) { mock('Application')                 }
  let(:response)    { mock('Response')                    }
  let(:request)     { mock('Request', :path_info => path) }
  
  this_spec = 'Status::Application::Router#route'

  shared_examples_for this_spec do

    before do
      expected_action.stub(:call => response)
    end

    it 'should call expected action' do
      expected_action.should_receive(:call).with(application, request).and_return(response)
      should be(response)
    end
    
    it 'action should be exepected action' do
      object.send(:action) == expected_action
    end

  end

  subject { object.route(application) }

  context 'with request to "/"' do
    let(:path)            { "/"                  }
    let(:expected_action) { Status::Action::Main }

    it_should_behave_like this_spec
  end

  context 'with request to unkown path' do
    let(:path)            { "/not-known"             }
    let(:expected_action) { Status::Action::NotFound }

    it_should_behave_like this_spec
  end

  context 'with request to "/assets/foo"' do

    let(:path)            { "/assets/foo"                            }
    let(:asset_handler)   { mock('Asset Handler', :call => response) }

    before do
      stub_const('Status::ASSET_HANDLER', asset_handler)
    end

    let(:expected_action) { Status::ASSET_HANDLER }

    it_should_behave_like this_spec
  end
end
