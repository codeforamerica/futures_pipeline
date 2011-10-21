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
      a_get("api/v1/careers.json").should have_been_made
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
        a_get("api/v1/careers/11-1011-00.json").should have_been_made
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
        a_get("api/v1/careers/11-1011-00.json").should have_been_made
        career.title.should == "Chief Executives"
      end
    end
  end

  describe "#search" do
    context "with no paramaters" do
      before do
        stub_get("api/v1/careers/search.json").
          to_return(:status => 200, :body => fixture("search.json"))
      end

      it "should return a search of careers" do
        lambda do
          @client.search
        end.should raise_error ArgumentError
      end
    end

    context "with MOC parameter" do
      before do
        stub_get("api/v1/careers/search.json?moc=11b").
          to_return(:status => 200, :body => fixture("search.json"))
      end

      it "should return one career related to the MOC" do
        search = @client.search("11b")
        a_get("api/v1/careers/search.json?moc=11b").should have_been_made
        search.first.title.should == "Training and Development Specialists"
      end
    end
  end

  describe "#assessment" do
    before do
      stub_get("api/v1/assessment.json").
        to_return(:status => 200, :body => fixture("assessment.json"))
    end

    it "should fetch all assessment questions" do
      assessment = @client.assessment
      a_get("api/v1/assessment.json").should have_been_made
      assessment.first.id.should == "interest_question_1"
    end
  end

  describe "#assessment_result" do
    before do
      stub_get("api/v1/careers/123451/12345123.json").
        to_return(:status => 200, :body => fixture("assessment_result.json"))
    end

    it "should fetch an assessment result" do
      assessment_result = @client.assessment_result(1, 2, 3, 4, 5, 1, 1, 2, 3, 4, 5, 1, 2, 3)
      a_get("api/v1/careers/123451/12345123.json").should have_been_made
      assessment_result.first.onet_soc_code.should == "27-3011.00"
    end
  end

end
