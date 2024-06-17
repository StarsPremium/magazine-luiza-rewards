# frozen_string_literal: true

module MagazineLuizaRewardsV2
  module Api
    class Customers < Base
      def create(customer)
        request(:post, '/api/v1/customers', customer.to_h)
      end
      alias create_customer create

      def get(document)
        request(:get, '/api/v1/customers', { document: document })
      end
      alias get_customer get

      def add_address(customer_id, address_add)
        request(:post, "/api/v1/customers/#{customer_id}/address", address_add.to_h)
      end
      alias add_customer_address add_address

      def get_address(customer_id, number, street, zip_code, complement = nil)
        options = { number: number, street: street, zip_code: zip_code, complement: complement }

        request(:get, "/api/v1/customers/#{customer_id}/address", options)
      end
      alias get_customer_address get_address
    end
  end
end
