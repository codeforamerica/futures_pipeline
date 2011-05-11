require 'futures_pipeline/connection'
require 'futures_pipeline/request'

module FuturesPipeline
  class Client
    include FuturesPipeline::Connection
    include FuturesPipeline::Request

    def careers(options={})
      get("/api/v1/careers.json", options)
    end
  end
end
