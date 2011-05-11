require 'faraday_middleware'

module FuturesPipeline
  module Connection
    private

    def connection
      Faraday::Connection.new(:ssl => {:verify => false}, :url => 'http://militarydemo.pipelinenc.com') do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::Rashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
