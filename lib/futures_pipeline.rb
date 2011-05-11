require 'futures_pipeline/client'

module FuturesPipeline

  def self.client(options={})
    FuturesPipeline::Client.new(options={})
  end

end
