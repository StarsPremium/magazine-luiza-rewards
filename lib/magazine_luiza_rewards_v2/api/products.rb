# frozen_string_literal: true

module MagazineLuizaRewardsV2
  module Api
    class Products < Base
      def products(limit = 10, page = 1, filters = {})
        options = filters.merge(_limit: limit, _page: page)
        response = request(:get, '/api/v1/products', options)

        response.map { |product| Product.new(product) }
      end

      def product_info(sku, seller)
        response = request(:get, "/api/v1/products/sku/#{sku}/seller/#{seller}")

        Product.new(response)
      end

      def pricing_and_availability(products = [], show_payment_methods: false)
        products_map = products.map { |product| product.to_h.slice(:sku, :seller_id) }

        options = { products: products_map, show_payment_methods: show_payment_methods }
        response = request(:post, '/api/v1/products/pricing_and_availability', options)

        return [default_product_price(products_map.first)] if response.blank?

        response.map do |product_price|
          if product_price[:availability] == 'out of stock'
            default_product_price(product_price)
          else
            ProductPrice.new(product_price)
          end
        end
      end

      private

      def default_product_price(product)
        ProductPrice.new(product_price_params(product))
      end

      def product_price_params(product)
        {
          sku: product[:sku],
          seller_id: product[:seller_id],
          availability: product.fetch(:availability, ''),
          price: 0.0,
          list_price: 0.0,
          best_price: {},
          payment_methods: {}
        }
      end
    end
  end
end
