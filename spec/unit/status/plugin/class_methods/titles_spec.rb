require 'spec_helper'

describe Status::Plugin, '.titles' do
  subject { object.titles }
  let(:object) { described_class }

  let(:expected_titles) do
    [
      'Gemnasium',
      'Codeclimate',
      'Travis',
      'Rubygems'
    ]
  end

  it { should eql(expected_titles) }
end
