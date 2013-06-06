require 'spec_helper'

describe Status::Project, '#has_tag' do
  let(:object) { described_class.new(name, tags)  }
  let(:name)   { mock('')                         }
  let(:tags)   { [tag, 'foo', 'bar']              }
  let(:tag)    { 'tag'                            } 
  subject      { object.has_tag(expected_tag)    }

  context 'with expected tag' do
    let(:expected_tag) { tag }

    it { should be(true) }
   
    it_should_behave_like 'an idempotent method'
  end

  context 'without expected tag' do
    let(:expected_tag) { 'other' }

    it { should be(false) }

    it_should_behave_like 'an idempotent method'
  end
end
