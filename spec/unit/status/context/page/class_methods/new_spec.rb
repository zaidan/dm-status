require 'spec_helper'

describe Status::Context::Page, '.new' do
  let(:object) { described_class }

  subject { object.new(attributes) }

  let(:content)          { mock('Content')          }
  let(:title)            { mock('Title')            }
  let(:meta_description) { mock('Meta Description') }

  context 'when not providing defautls' do
    let(:attributes) { { :content => content } }

    its(:content)          { should be(content)                                            }
    its(:title)            { should be(described_class::DEFAULTS.fetch(:title))            }
    its(:meta_description) { should be(described_class::DEFAULTS.fetch(:meta_description)) }
  end
  
  context 'when provding values for defaults' do
    let(:attributes) do 
      { 
        :content          => content,
        :title            => title,
        :meta_description => meta_description
      }
    end

    its(:content)          { should be(content)          }
    its(:title)            { should be(title)            }
    its(:meta_description) { should be(meta_description) }
  end
end
