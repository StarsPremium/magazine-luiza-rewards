# frozen_string_literal: true

module MagazineLuizaRewards
  module Api
    class Orders < Base
      def create(order_request)
        response = request(:post, '/api/v1/orders', order_request.to_h)

        Order.new(response)
      end
    end
  end
end
