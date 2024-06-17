# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Client
    extend Forwardable

    attr_accessor :base_url, :oauth_token

    def_delegators :products_api, :products, :product_info, :pricing_and_availability
    def_delegators :carts_api, :create_cart, :get_cart, :update_cart, :add_item_to_cart,
                   :remove_item_from_cart, :update_item_quantity
    def_delegators :customers_api, :create_customer, :get_customer, :add_customer_address,
                   :get_customer_address
    def_delegators :freight_api, :estimate_freight, :calculate_freight
    def_delegators :categories_api, :categories

    DEFAULT_BASE_URL = 'http://b2b-platform-staging.luizalabs.com'

    def initialize(oauth_token = nil)
      @oauth_token = oauth_token
      @base_url = DEFAULT_BASE_URL
    end

    def login(username, password)
      api = Api::Authentication.new(self)
      @oauth_token = nil
      token_info = api.generate_token(username, password)
      @oauth_token = token_info.access_token

      token_info
    end

    def faraday
      Faraday.new(base_url) do |config|
        configure_response(config)
        configure_headers(config)
        config.request :json
        config.adapter Faraday.default_adapter
      end
    end

    private

    def products_api
      @products_api ||= Api::Products.new(self)
    end

    def carts_api
      @carts_api ||= Api::Carts.new(self)
    end

    def categories_api
      @categories_api ||= Api::Categories.new(self)
    end

    def customers_api
      @customers_api ||= Api::Customers.new(self)
    end

    def freight_api
      @freight_api ||= Api::Freight.new(self)
    end

    def configure_headers(config)
      config.headers['Accept-Encoding'] = 'none'
      config.headers['Authorization'] = "Bearer #{oauth_token}" unless oauth_token.nil?
    end

    def configure_response(config)
      logger = Logger.new $stderr

      config.response :json, parser_options: { symbolize_names: true }
      config.response :raise_error
      config.response :logger, logger, bodies: true, headers: true if ENV['DEBUG']
    end
  end
end
