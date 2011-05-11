require 'futures_pipeline/connection'
require 'futures_pipeline/request'

module FuturesPipeline
  class Client
    include FuturesPipeline::Connection
    include FuturesPipeline::Request
  end
end
