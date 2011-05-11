require 'futures_pipeline/connection'
require 'futures_pipeline/request'

module FuturesPipeline
  class Client
    include FuturesPipeline::Connection
    include FuturesPipeline::Request

    # Get a list of all the available careers. Returns an array of 50 careers per request. Use offset option to get more.
    #
    # @param options [Hash] A customizable set of options.
    # @option options offset [Integer] The offset from the first career in the list.
    # @return [Array<Hashie::Mash>]
    # @example
    #   @client = FuturesPipeline.new
    #   @client.careers
    def careers(options={})
      get("/api/v1/careers.json", options)
    end
  end
end
