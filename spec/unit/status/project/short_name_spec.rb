require 'spec_helper'

describe Status::Project, '#short_name' do
  let(:object) { described_class.new('mbj/dm-status', tags) }
  let(:tags)   { mock('')                                   }

  subject { object.short_name }

  it_should_behave_like 'an idempotent method'

  it { should eql('dm-status') }
end
