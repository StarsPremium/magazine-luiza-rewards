# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Cart < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute? :items, Types::Array.of(CartItem)
    attribute? :promocode, Types::Coercible::String
    attribute? :total_amount, Types::Coercible::Decimal
    attribute? :total_best_amount, Types::Coercible::Decimal
    attribute :customer_id, Types::Coercible::String
    attribute? :billing_address_id, Types::Coercible::String
    attribute :shipping_address_id, Types::Coercible::String
    attribute? :deliveries, Types::Array.of(PartialUpdateDeliveries)
  end
end
