require 'spec_helper'

describe Status::Project, '#tags' do
  let(:object) { described_class.new(name, tags)  }
  let(:name)   { mock('')                         }
  let(:tags)   { ['tag']                          }

  let(:tag)    { Status::Tag.new('tag')           }

  subject      { object.tags                      }

  it_should_behave_like 'an idempotent method'


  it { should eql([tag]) }
end
