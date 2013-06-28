require 'spec_helper'

describe Status::Project, '#plugins' do
  let(:object)  { described_class.new(name, tags)          }

  let(:name)    { 'mbj/rom-status'                         }
  let(:tags)    { mock('tags')                             }
  let(:plugin)  { mock('plugin')                           }
  let(:plugins) { [Status::Plugin::Rubygems]               }
  
  subject       { object.plugins                           }


  before do
    Status::Plugin::Rubygems.stub(:new => plugin)
    Status::Plugin.stub(:descendants => plugins)
  end

  it_should_behave_like 'an idempotent method'


  it { should eql([plugin]) }

  it 'should call Rubygems.new' do
    Status::Plugin::Rubygems.should_receive(:new).
      with(name, 'rom-status').
      and_return(plugin)

    subject
  end
  
  it 'should call Plugin.descendants' do
    Status::Plugin.should_receive(:descendants).
      and_return(plugins)

    subject
  end
end
