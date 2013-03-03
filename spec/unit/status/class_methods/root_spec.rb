require 'spec_helper'

describe Status, '.root' do
  let(:object) { described_class }

  subject { object.root }

  it_should_behave_like 'an idempotent method'

  it { should eql(Pathname.new(__FILE__).parent.parent.parent.parent.parent) }
end
