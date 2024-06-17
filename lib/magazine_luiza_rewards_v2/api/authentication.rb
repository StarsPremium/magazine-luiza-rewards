# frozen_string_literal: true

module MagazineLuizaRewardsV2
  module Api
    class Authentication < Base
      def generate_token(username, password)
        options = { username: username, password: password }
        response = request(:post, '/api/v1/oauth/token', options)
        TokenInfo.new(response)
      end
    end
  end
end
