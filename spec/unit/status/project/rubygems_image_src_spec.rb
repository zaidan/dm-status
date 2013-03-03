require 'spec_helper'

describe Status::Project, '#rubygems_image_src' do
  let(:object) { described_class.new('mbj/dm-status') }

  subject { object.rubygems_image_src }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://badge.fury.io/rb/dm-status.png') }
end
