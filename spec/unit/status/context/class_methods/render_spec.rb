require 'spec_helper'

describe Status::Context, '.render' do
  let(:object) { described_class::Page }

  subject { object.render(attributes) }

  let(:attributes) { 
    { 
      :title            => 'TITLE', 
      :heading          => 'HEADING',
      :meta_description => 'META', 
      :content          => 'CONTENT'
    }
  }

  # Yeah these are weak expectations
  its(:content) { should include('TITLE') }
  its(:content) { should include('META') }
  its(:content) { should include('CONTENT') }
end
