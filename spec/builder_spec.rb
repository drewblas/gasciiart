require 'spec_helper'

describe Gasciiart::Builder do
  it 'should initialize' do
    builder = nil

    # Not really necessary, since this exception isn't caught,
    # but that's all this spec does, so let's be explicit
    expect {
      builder = Gasciiart::Builder.new('./', 'output')
    }.not_to raise_exception

    builder.source.should  == './'
    builder.target.should  == 'output'
    builder.options.should == {}
  end
end
