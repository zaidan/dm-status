require 'spec_helper'

describe Status::Plugin::Rubygems, '#image_src' do
  let(:object)     { described_class.new(name, short_name) }

  let(:name)       { 'mbj/rom-status'                      }

  let(:short_name) { 'rom-status'                          }

  subject          { object.image_src                      }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://badge.fury.io/rb/rom-status.png') }
end
