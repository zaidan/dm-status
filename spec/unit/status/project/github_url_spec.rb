require 'spec_helper'

describe Status::Project, '#github_url' do
  let(:object)  { described_class.new(name, tags)                     }

  let(:name)    { 'mbj/rom-status'                                    }

  let(:tags)    { mock('tags')                                        }

  subject       { object.github_url                                   }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://github.com/mbj/rom-status') }
end
