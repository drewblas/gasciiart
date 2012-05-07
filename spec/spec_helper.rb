require 'rspec'
require 'gasciiart'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
