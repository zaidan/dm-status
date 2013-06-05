require 'spec_helper'

describe Status::Application, '#call' do
  let(:object) { described_class.new(config) }

  let(:config)   { mock('Config')                                                  }
  let(:response) { mock('Response')                                                }
  let(:request)  { mock('Request', :path_info => path, :query_params_hash => get ) }
  let(:get)      { {}                                                              }

  this_spec = 'Status::Application#call'

  shared_examples_for this_spec do
    it 'should call expected action' do
      expected_action.should_receive(:call).with(object, request).and_return(response)
      should be(response)
    end
  end

  subject { object.call(request) }

  context 'with request to "/"' do
    let(:path)            { "/"                  }
    let(:expected_action) { Status::Action::Main }

    it_should_behave_like this_spec
  end

  context 'with request to "/" and tag' do
    let(:get)             { { 'tag' => 'foo' }    }
    let(:path)            { "/"                  }
    let(:expected_action) { Status::Action::Tag  }

    it_should_behave_like this_spec
  end

  context 'with request to unkown path' do
    let(:path)            { "/not-known"             }
    let(:expected_action) { Status::Action::NotFound }

    it_should_behave_like this_spec
  end

  context 'with request to "/assets/foo"' do
    let(:path)            { "/assets/foo"         }
    before do
      stub_const('Status::ASSET_HANDLER', mock('Asset Handler'))
    end
    let(:expected_action) { Status::ASSET_HANDLER }

    it_should_behave_like this_spec
  end
end
