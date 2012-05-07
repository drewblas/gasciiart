require 'spec_helper'

describe Gasciiart::Builder do
  let(:builder) { Gasciiart::Builder.new('./', 'output') }
  subject { builder }

  it 'should initialize' do
    b = nil

    # Not really necessary, since this exception isn't caught,
    # but that's all this spec does, so let's be explicit
    expect {
      b = Gasciiart::Builder.new('./', 'output')
    }.not_to raise_exception

    b.source.should  == './'
    b.target.should  == 'output/'
    b.options.should == {}
  end

  context "setup_target" do
    it "should create the directory" do
      builder.setup_target
      File.directory?("output/").should == true
    end
  end


end
