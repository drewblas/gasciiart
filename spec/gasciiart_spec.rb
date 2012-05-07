require 'spec_helper'

describe Gasciiart do
  it 'should return the version' do
    Gasciiart::VERSION.should be_a(String)
  end
end
