class Gasciiart::Builder
  attr_reader :source, :target, :options

  def initialize(source, target, options = {})
    @source, @target, @options = source, target, options
  end

  # Where all the magic happens
  def build!

  end
end
