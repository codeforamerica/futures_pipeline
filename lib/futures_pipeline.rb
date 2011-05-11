require 'futures_pipeline/client'

module FuturesPipeline

  def self.client
    FuturesPipeline::Client.new
  end

  def self.new
    client
  end

end
