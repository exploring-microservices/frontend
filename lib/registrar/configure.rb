require "registrar/configuration"

module Registrar
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure(&block)
    block.call(configuration)
  end
end
