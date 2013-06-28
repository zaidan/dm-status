require 'spec_helper'

describe Status::Plugin::Travis, '#image_src' do
  let(:object)     { described_class.new(name, short_name) }

  let(:name)       { 'mbj/rom-status'                      }

  let(:short_name) { 'rom-status'                          }

  subject          { object.image_src                      }

  it_should_behave_like 'an idempotent method'

  it { should eql('https://travis-ci.org/mbj/rom-status.png?branch=master') }
end
