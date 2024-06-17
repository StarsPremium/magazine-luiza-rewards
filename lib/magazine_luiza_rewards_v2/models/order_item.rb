# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class OrderItem < Dry::Struct
    attribute :sku, Types::Coercible::String
    attribute :seller, Types::Coercible::String
    attribute :seller_sku, Types::Coercible::String
    attribute :quantity, Types::Coercible::Integer
    attribute :seller_description, Types::Coercible::String
    attribute :catalog_price, Types::Coercible::Decimal
  end
end
