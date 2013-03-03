require 'spec_helper'

describe Status::Application, '#members' do
  subject { object.members }
  let(:object) { described_class.new(config) }
  let(:config) do
    {
      'team' => [
        {
          'name'   => 'Name A',
          'nick'   => 'nick-a',
          'github' => 'gh-a',
        },
        {
          'name'    => 'Name B',
          'nick'    => 'nick-b',
          'github'  => 'gh-b',
          'twitter' => 'tw-b',
          'url'     => 'url-b',
        },
      ]
    }
  end

  let(:expected_members) do
    [
      Status::Member.new(
        :name             => 'Name A',
        :nick             => 'nick-a',
        :github_username  => 'gh-a',
        :twitter_username => nil,
        :url              => nil
      ),
      Status::Member.new(
        :name             => 'Name B',
        :nick             => 'nick-b',
        :github_username  => 'gh-b',
        :twitter_username => 'tw-b',
        :url              => 'url-b'
      )
    ]
  end

  it { should eql(expected_members) }
end
