require 'helper'

describe FuturesPipeline do
  describe ".new" do
    it "should return a FuturesPipeline::Client" do
      FuturesPipeline.new.should be_a FuturesPipeline::Client
    end
  end
end
