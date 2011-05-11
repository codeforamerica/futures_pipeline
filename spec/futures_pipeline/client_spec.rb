require 'helper'

describe FuturesPipeline::Client do
  before do
    @client = FuturesPipeline::Client.new
  end

  describe ".careers" do
    @client = FuturesPipeline::Client.new
    careers = @client.careers
    careers.first.title.should == "Chief Executives"
  end
end
