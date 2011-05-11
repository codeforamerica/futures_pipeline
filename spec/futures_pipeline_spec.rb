require 'helper'

describe FuturesPipeline do
  describe ".client" do
    it "should be a FuturesPipeline::Client" do
      FuturesPipeline.client.should be_a FuturesPipeline::Client
    end
  end
end
