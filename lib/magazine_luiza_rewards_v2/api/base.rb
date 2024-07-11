# frozen_string_literal: true

require 'forwardable'

module MagazineLuizaRewardsV2
  module Api
    class Base
      extend Forwardable
      include Exceptions

      def initialize(client = MagazineLuizaRewardsV2::Client.new)
        @client = client
      end

      private

      def_delegators :@client, :faraday

      def request(method, path, options = {})
        retry_count = 0

        begin
          response = faraday.public_send(method, path, options)

          response.body
        rescue Faraday::TimeoutError => e
          retry_count += 1
          raise RequestTimeoutError, e.message if retry_count > 3

          retry
        rescue Faraday::Error => e
          handle_error(e)
        end
      end

      def handle_error(error)
        response = error.response
        body = [JSON.parse(response[:body], symbolize_names: true)].flatten if response[:body]
        messages = body&.map { |content| content[:message] }
        message = messages&.join(', ') || error.message

        raise error_class(response[:status]), message
      end
    end
  end
end
