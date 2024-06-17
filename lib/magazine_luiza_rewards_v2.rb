# frozen_string_literal: true

require 'dry-struct'
require 'faraday'

require_relative 'magazine_luiza_rewards_v2/version'
require_relative 'magazine_luiza_rewards_v2/exceptions'
require_relative 'magazine_luiza_rewards_v2/client'
require_relative 'magazine_luiza_rewards_v2/types'

# Api
require_relative 'magazine_luiza_rewards_v2/api/base'
require_relative 'magazine_luiza_rewards_v2/api/authentication'
require_relative 'magazine_luiza_rewards_v2/api/freight'
require_relative 'magazine_luiza_rewards_v2/api/products'
require_relative 'magazine_luiza_rewards_v2/api/carts'
require_relative 'magazine_luiza_rewards_v2/api/customers'
require_relative 'magazine_luiza_rewards_v2/api/orders'
require_relative 'magazine_luiza_rewards_v2/api/categories'

# models
require_relative 'magazine_luiza_rewards_v2/models/token_info'
require_relative 'magazine_luiza_rewards_v2/models/sub_category'
require_relative 'magazine_luiza_rewards_v2/models/category'
require_relative 'magazine_luiza_rewards_v2/models/delivery_type'
require_relative 'magazine_luiza_rewards_v2/models/estimated_freight'
require_relative 'magazine_luiza_rewards_v2/models/shipping_time_response'
require_relative 'magazine_luiza_rewards_v2/models/delivery_modality'
require_relative 'magazine_luiza_rewards_v2/models/delivery_item'
require_relative 'magazine_luiza_rewards_v2/models/delivery'
require_relative 'magazine_luiza_rewards_v2/models/unavailable_delivery'
require_relative 'magazine_luiza_rewards_v2/models/calculated_freight'
require_relative 'magazine_luiza_rewards_v2/models/factsheet_element_element'
require_relative 'magazine_luiza_rewards_v2/models/factsheet_element'
require_relative 'magazine_luiza_rewards_v2/models/factsheet'
require_relative 'magazine_luiza_rewards_v2/models/product_attribute'
require_relative 'magazine_luiza_rewards_v2/models/product_bundle'
require_relative 'magazine_luiza_rewards_v2/models/product_dimension'
require_relative 'magazine_luiza_rewards_v2/models/product'
require_relative 'magazine_luiza_rewards_v2/models/best_price'
require_relative 'magazine_luiza_rewards_v2/models/installment_plans'
require_relative 'magazine_luiza_rewards_v2/models/payment_methods'
require_relative 'magazine_luiza_rewards_v2/models/product_price'
require_relative 'magazine_luiza_rewards_v2/models/cart_item'
require_relative 'magazine_luiza_rewards_v2/models/delivery_parameters'
require_relative 'magazine_luiza_rewards_v2/models/modality'
require_relative 'magazine_luiza_rewards_v2/models/partial_update_deliveries'
require_relative 'magazine_luiza_rewards_v2/models/cart'
require_relative 'magazine_luiza_rewards_v2/models/phone'
require_relative 'magazine_luiza_rewards_v2/models/address'
require_relative 'magazine_luiza_rewards_v2/models/address_add'
require_relative 'magazine_luiza_rewards_v2/models/customer'
require_relative 'magazine_luiza_rewards_v2/models/bank_slip'
require_relative 'magazine_luiza_rewards_v2/models/order_item'
require_relative 'magazine_luiza_rewards_v2/models/pix'
require_relative 'magazine_luiza_rewards_v2/models/order_payment'
require_relative 'magazine_luiza_rewards_v2/models/package_item'
require_relative 'magazine_luiza_rewards_v2/models/package'
require_relative 'magazine_luiza_rewards_v2/models/order'
require_relative 'magazine_luiza_rewards_v2/models/shipping_contact'
require_relative 'magazine_luiza_rewards_v2/models/payment_info'
require_relative 'magazine_luiza_rewards_v2/models/order_request'

module MagazineLuizaRewardsV2
  def self.root
    File.expand_path '..', __dir__
  end
end
