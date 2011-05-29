require 'futures_pipeline/client'

module FuturesPipeline
  # Alias for FuturesPipeline::Client.new
  #
  # @return [FuturesPipeline::Client]
  def self.new(options={})
    FuturesPipeline::Client.new(options)
  end

  # Delegate to FuturesPipeline::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private=false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
