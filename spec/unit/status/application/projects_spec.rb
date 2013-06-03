require 'spec_helper'

describe Status::Application, '#projects' do
  subject { object.projects }
  let(:object) { described_class.new(config) }
  let(:config) do
    {
      'projects' => [
        {
          'name'   => 'mbj/status',
          'tags'   => ['tag']
        },
        {
          'name'   => 'mbj/other'
        },
      ]
    }
  end

  it_should_behave_like 'an idempotent method'

  let(:expected_projects) do
    [
      Status::Project.new(
        'mbj/status',
        ['tag']
      ),
      Status::Project.new(
        'mbj/other',
        []
      )
    ]
  end

  it { should eql(expected_projects) }
end
