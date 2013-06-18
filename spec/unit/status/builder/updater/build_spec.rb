require 'spec_helper'

describe Status::Builder::Updater, '#build' do

  let(:path)   { Pathname.new(Dir.pwd).expand_path('../../../../').join("build") }

  let(:object) { described_class.new(path)                                       }

  subject      { object.build                                                    }

  before do
    FileUtils.mkdir_p path
    FileUtils.cp(File.join(File.expand_path('..', path), 'spec/', 'config.yml'), path)
  end

  after do
    FileUtils.rm_rf path
  end

  it 'should build' do
    subject

    should be object
    File.size(path.join('index.html')).should == 3121
    File.exist?(path.join('assets', 'application.css')).should == false
    File.size(path.join('assets', 'application.js')).should == 678
  end

  its(:create_assets_dir) { should be object }
  its(:write_index_page)  { should be object }
end
