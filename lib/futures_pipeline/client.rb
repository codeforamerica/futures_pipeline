require 'futures_pipeline/connection'
require 'futures_pipeline/request'

module FuturesPipeline
  class Client
    include FuturesPipeline::Connection
    include FuturesPipeline::Request

    # Get a list of all the available careers. Returns an array of 50 careers per request. Use offset option to get more.
    #
    # @param options [Hash] A customizable set of options.
    # @option options rpp [Integer] The results per page from the first career in the list.
    # @option options page [Integer] the page of results from the first career in the list.
    # @return [Array<Hashie::Mash>]
    # @example
    #   FuturesPipeline.careers
    def careers(options={})
      get("/api/v1/careers.json", options)
    end

    # Get a single career using O\*NET code.
    #
    # @param onet_soc_code [String] The O\*NET code
    # @return [Hashie::Mash]
    # @raise [Faraday::Error::ResourceNotFound] If O\*NET code is not found.
    # @example
    #   FuturesPipeline.career("11-1011.00")
    def career(onet_soc_code)
      api_safe_onet_soc_code = onet_soc_code.tr(".", "-")
      get("/api/v1/careers/#{api_safe_onet_soc_code}.json")
    end

    # Search for careers by MOC code.  Returns a list of careers related to the MOC.
    #
    # @param moc [String] The MOC
    # @return [Hashie::Mash]
    # @example
    #   FuturesPipeline.search("11b")
    def search(moc)
       get("/api/v1/careers/search.json?moc=#{moc}")
    end

    # Get the skill/interest assessment questions and possible answers
    #
    # @return [Hashie::Mash]
    # @example
    #   FuturesPipeline.assessment
    def assessment
       get("/api/v1/assessment.json")
    end

    # Get the results from the skill/interest assessment
    #
    # @param i1 [Integer] The numeric answer to interest question 1
    # @param i2 [Integer] The numeric answer to interest question 2
    # @param i3 [Integer] The numeric answer to interest question 3
    # @param i4 [Integer] The numeric answer to interest question 4
    # @param i5 [Integer] The numeric answer to interest question 5
    # @param i6 [Integer] The numeric answer to interest question 6
    # @param s1 [Integer] The numeric answer to skill question 1
    # @param s2 [Integer] The numeric answer to skill question 2
    # @param s3 [Integer] The numeric answer to skill question 3
    # @param s4 [Integer] The numeric answer to skill question 4
    # @param s5 [Integer] The numeric answer to skill question 5
    # @param s6 [Integer] The numeric answer to skill question 6
    # @param s7 [Integer] The numeric answer to skill question 7
    # @param s8 [Integer] The numeric answer to skill question 8
    # @return [Hashie::Mash]
    # @example
    #   FuturesPipeline.assessment_results(1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4)
    def assessment_result(i1, i2, i3, i4, i5, i6, s1, s2, s3, s4, s5, s6, s7, s8)
       get("/api/v1/careers/#{[i1, i2, i3, i4, i5, i6].join}/#{[s1, s2, s3, s4, s5, s6, s7, s8].join}.json")
    end

  end
end
