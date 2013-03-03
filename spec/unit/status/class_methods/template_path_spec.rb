require 'spec_helper'

describe Status, '.template_path' do
  let(:object) { described_class }

  subject { object.template_path }

  it_should_behave_like 'an idempotent method'

  it { should eql(object.root.join('templates')) }
end
