require 'spec_helper'

describe Status::Plugin::Travis, '#url' do
  let(:object)     { described_class.new(name, short_name) }

  let(:name)       { 'mbj/rom-status'                      }

  let(:short_name) { 'rom-status'                          }

  subject          { object.url                            }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://api.travis-ci.org/mbj/rom-status') }
end
