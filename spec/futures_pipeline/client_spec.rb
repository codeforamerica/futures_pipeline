require 'helper'

describe FuturesPipeline::Client do
  before do
    @client = FuturesPipeline::Client.new
  end

  describe "#careers" do
    before do
      stub_get("api/v1/careers.json").
        to_return(:status => 200, :body => fixture("careers.json"))
    end

    it "should fetch all careers" do
      careers = @client.careers
      careers.first.title.should == "Chief Executives"
    end
  end

  describe "#career" do
    context "with API-safe O*NET code" do
      before do
        stub_get("api/v1/careers/11-1011-00.json").
          to_return(:status => 200, :body => fixture("career.json"))
      end

      it "should fetch one career" do
        career = @client.career("11-1011-00")
        career.title.should == "Chief Executives"
      end
    end

    context "with O*NET status code" do
      before do
        stub_get("api/v1/careers/11-1011-00.json").
          to_return(:status => 200, :body => fixture("career.json"))
      end

      it "should fetch one career" do
        career = @client.career("11-1011.00")
        career.title.should == "Chief Executives"
      end
    end
  end
  
  describe "#search" do
    before do
      stub_get("api/v1/search.json").
        to_return(:status => 200, :body => fixture("search.json"))
    end
    
    it "should return a search of careers" do
      search = @client.search
      search.first.title.should == "Chief Executives"
    end  
  end
  

end
