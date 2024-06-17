# frozen_string_literal: true

module MagazineLuizaRewards
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
        response.map { |product_price| ProductPrice.new(product_price) }
      end
    end
  end
end
