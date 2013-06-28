require 'spec_helper'

describe Status::Project, '#github_api_url' do
  let(:object)  { described_class.new(name, tags)                     }

  let(:name)    { 'mbj/rom-status'                                    }

  let(:tags)    { mock('tags')                                        }

  subject       { object.github_api_url                               }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://api.github.com/repo/mbj/rom-status') }
end
