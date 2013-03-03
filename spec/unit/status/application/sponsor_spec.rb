require 'spec_helper'

describe Status::Application, '#sponsors' do
  subject { object.sponsors }
  let(:object) { described_class.new(config) }
  let(:config) do
    {
      'sponsors' => [
        {
          'name' => 'Name A',
          'url'  => 'The URL'
        },
        {
          'name'     => 'Name B',
          'url'      => 'The URL',
          'logo'     => 'https://example.com/image.png',
          'markdown' => 'The Markdown'
        }
      ]
    }
  end

  let(:expected_sponsors) do
    [
      Status::Sponsor.new(
        :name     => 'Name A',
        :url      => 'The URL',
        :logo     => nil,
        :markdown => nil
      ),
      Status::Sponsor.new(
        :name     => 'Name B',
        :url      => 'The URL',
        :logo     => 'https://example.com/image.png',
        :markdown => 'The Markdown'
      )
    ]
  end

  it { should eql(expected_sponsors) }
end
