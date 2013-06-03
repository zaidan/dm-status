require 'spec_helper'

describe Status::Project, '#github_url' do
  let(:object) { described_class.new('mbj/dm-status', tags) }
  let(:tags)   { mock('')                                   }

  subject { object.github_url }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://github.com/mbj/dm-status') }
end
