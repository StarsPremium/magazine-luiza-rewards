# frozen_string_literal: true

require 'dry-struct'
require 'faraday'

require_relative 'magazine_luiza_rewards/version'
require_relative 'magazine_luiza_rewards/exceptions'
require_relative 'magazine_luiza_rewards/client'
require_relative 'magazine_luiza_rewards/types'

# Api
require_relative 'magazine_luiza_rewards/api/base'
require_relative 'magazine_luiza_rewards/api/authentication'
require_relative 'magazine_luiza_rewards/api/freight'
require_relative 'magazine_luiza_rewards/api/products'
require_relative 'magazine_luiza_rewards/api/carts'
require_relative 'magazine_luiza_rewards/api/customers'
require_relative 'magazine_luiza_rewards/api/orders'
require_relative 'magazine_luiza_rewards/api/categories'

# models
require_relative 'magazine_luiza_rewards/models/token_info'
require_relative 'magazine_luiza_rewards/models/sub_category'
require_relative 'magazine_luiza_rewards/models/category'
require_relative 'magazine_luiza_rewards/models/delivery_type'
require_relative 'magazine_luiza_rewards/models/estimated_freight'
require_relative 'magazine_luiza_rewards/models/shipping_time_response'
require_relative 'magazine_luiza_rewards/models/delivery_modality'
require_relative 'magazine_luiza_rewards/models/delivery_item'
require_relative 'magazine_luiza_rewards/models/delivery'
require_relative 'magazine_luiza_rewards/models/unavailable_delivery'
require_relative 'magazine_luiza_rewards/models/calculated_freight'
require_relative 'magazine_luiza_rewards/models/factsheet_element_element'
require_relative 'magazine_luiza_rewards/models/factsheet_element'
require_relative 'magazine_luiza_rewards/models/factsheet'
require_relative 'magazine_luiza_rewards/models/product_attribute'
require_relative 'magazine_luiza_rewards/models/product_bundle'
require_relative 'magazine_luiza_rewards/models/product_dimension'
require_relative 'magazine_luiza_rewards/models/product'
require_relative 'magazine_luiza_rewards/models/best_price'
require_relative 'magazine_luiza_rewards/models/installment_plans'
require_relative 'magazine_luiza_rewards/models/payment_methods'
require_relative 'magazine_luiza_rewards/models/product_price'
require_relative 'magazine_luiza_rewards/models/cart_item'
require_relative 'magazine_luiza_rewards/models/delivery_parameters'
require_relative 'magazine_luiza_rewards/models/modality'
require_relative 'magazine_luiza_rewards/models/partial_update_deliveries'
require_relative 'magazine_luiza_rewards/models/cart'
require_relative 'magazine_luiza_rewards/models/phone'
require_relative 'magazine_luiza_rewards/models/address'
require_relative 'magazine_luiza_rewards/models/address_add'
require_relative 'magazine_luiza_rewards/models/customer'
require_relative 'magazine_luiza_rewards/models/bank_slip'
require_relative 'magazine_luiza_rewards/models/order_item'
require_relative 'magazine_luiza_rewards/models/pix'
require_relative 'magazine_luiza_rewards/models/order_payment'
require_relative 'magazine_luiza_rewards/models/package_item'
require_relative 'magazine_luiza_rewards/models/package'
require_relative 'magazine_luiza_rewards/models/order'
require_relative 'magazine_luiza_rewards/models/shipping_contact'
require_relative 'magazine_luiza_rewards/models/payment_info'
require_relative 'magazine_luiza_rewards/models/order_request'

module MagazineLuizaRewards
  def self.root
    File.expand_path '..', __dir__
  end
end
