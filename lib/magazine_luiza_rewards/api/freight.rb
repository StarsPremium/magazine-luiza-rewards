# frozen_string_literal: true

module MagazineLuizaRewardsV2
  module Api
    class Freight < Base
      def calculate(zip_code, cart_id)
        path = "/api/v1/shipping/#{zip_code}/cart/#{cart_id}"
        response = request(:get, path)

        CalculatedFreight.new(response)
      end
      alias calculate_freight calculate

      def estimate(zip_code, sku, seller)
        path = "/api/v1/shipping/#{zip_code}/sku/#{sku}/seller/#{seller}"
        response = request(:get, path)

        EstimatedFreight.new(response[:package])
      end
      alias estimate_freight estimate
    end
  end
end
