# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class ProductPrice < Dry::Struct
    attribute :sku, Types::Coercible::String
    attribute :seller_id, Types::Coercible::String
    attribute :availability, Types::Coercible::String
    attribute :list_price, Types::Coercible::String
    attribute :price, Types::Coercible::String
    attribute :best_price, BestPrice
    attribute :payment_methods, PaymentMethods
  end
end
