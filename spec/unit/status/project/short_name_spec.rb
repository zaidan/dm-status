require 'spec_helper'

describe Status::Project, '#short_name' do
  let(:object)  { described_class.new(name, tags)                     }

  let(:name)    { 'mbj/rom-status'                                    }

  let(:tags)    { mock('tags')                                        }
  
  subject       { object.short_name                                   }

  it_should_behave_like 'an idempotent method'

  it { should eql('rom-status') }
end
