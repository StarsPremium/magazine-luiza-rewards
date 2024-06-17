# frozen_string_literal: true

module MagazineLuizaRewardsV2
  module Api
    class Carts < Base
      def create(items = [])
        options = { items: items.map { |item| item.to_h.slice(:sku, :seller, :quantity) } }
        response = request(:post, '/api/v1/carts/', options)

        Cart.new(response)
      end
      alias create_cart create

      def get(card_id)
        response = request(:get, "/api/v1/carts/#{card_id}")

        Cart.new(response)
      end
      alias get_cart get

      def update(cart)
        options = cart.to_h.slice(:shipping_address_id, :customer_id,
                                  :billing_address_id, :deliveries)
        response = request(:patch, "/api/v1/carts/#{cart.id}", options)

        Cart.new(response)
      end
      alias update_cart update

      def add_item(cart_id, item)
        options = item.to_h.slice(:sku, :seller, :quantity)
        response = request(:post, "/api/v1/carts/#{cart_id}/items", options)

        Cart.new(response)
      end
      alias add_item_to_cart add_item

      def update_item_quantity(cart_id, item)
        options = item.to_h.slice(:quantity)
        url = "/api/v1/carts/#{cart_id}/items/#{item.sku}/seller/#{item.seller}"
        response = request(:patch, url, options)

        Cart.new(response)
      end

      def remove_item(cart_id, item)
        url = "/api/v1/carts/#{cart_id}/items/#{item.sku}/seller/#{item.seller}"
        response = request(:delete, url)

        Cart.new(response)
      end
      alias remove_item_from_cart remove_item
    end
  end
end
