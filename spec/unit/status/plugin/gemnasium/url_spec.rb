require 'spec_helper'

describe Status::Plugin::Gemnasium, '#url' do
  let(:object)     { described_class.new(name, short_name) }

  let(:name)       { 'mbj/rom-status'                      }

  let(:short_name) { 'rom-status'                          }

  subject          { object.url                            }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://gemnasium.com/mbj/rom-status') }
end
