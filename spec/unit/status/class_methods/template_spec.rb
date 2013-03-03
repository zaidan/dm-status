require 'spec_helper'

describe Status, '.template' do
  let(:object) { described_class }

  subject { object.template('layout.haml') }

  its(:file) { should eql(object.root.join('templates/layout.haml').to_s) }
  it { should be_a(Tilt::HamlTemplate) }
end

