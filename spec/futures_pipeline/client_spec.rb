require 'helper'

describe FuturesPipeline::Client do
  before do
    @client = FuturesPipeline::Client.new
  end

  describe "#careers" do
    it "should fetch all careers" do
      careers = @client.careers
      careers.first.title.should == "Chief Executives"
    end
  end
  
  describe "#career" do
    it "should fetch one career" do
      career = @client.career("11-1011-00")
      career.title.should == "Chief Executives"
    end
  end
  
end
