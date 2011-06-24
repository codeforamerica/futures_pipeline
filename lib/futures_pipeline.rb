require 'futures_pipeline/client'

module FuturesPipeline
  class << self
    # Alias for FuturesPipeline::Client.new
    #
    # @return [FuturesPipeline::Client]
    def new
      FuturesPipeline::Client.new
    end

    # Delegate to FuturesPipeline::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
