require 'spec_helper'

describe Status::Project, '#travis_status_url' do
  let(:object) { described_class.new('mbj/dm-status') }

  subject { object.travis_status_url }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://travis-ci.org/mbj/dm-status') }
end
