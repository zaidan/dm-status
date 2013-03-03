require 'spec_helper'

describe Status::Project, '#rubygems_url' do
  let(:object) { described_class.new('mbj/dm-status') }

  subject { object.rubygems_url }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://rubygems.org/gem/dm-status') }
end
