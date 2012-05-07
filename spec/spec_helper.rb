require 'rspec'
# require 'fakefs'
require 'fakefs/spec_helpers'
require 'gasciiart'

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers

  config.color_enabled = true
  config.formatter     = 'documentation'
end
