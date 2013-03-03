require 'spec_helper'

describe Status::Project, '#travis_api_url' do
  let(:object) { described_class.new('mbj/dm-status') }

  subject { object.travis_api_url }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://api.travis-ci.org/repo/mbj/dm-status') }
end
