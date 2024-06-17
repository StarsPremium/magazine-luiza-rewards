# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Order < Dry::Struct
    attribute :customer_id, Types::Coercible::String
    attribute :shipping do
      attribute :packages, Types::Array.of(Package)
    end
    attribute :shipping_total, Types::Coercible::Decimal
    attribute :product_total, Types::Coercible::Decimal
    attribute :created_at, Types::Coercible::String
    attribute :total_amount, Types::Coercible::Decimal
    attribute? :payments, OrderPayment
    attribute :items, Types::Array.of(OrderItem)
    attribute :display_order_id, Types::Coercible::String
    attribute? :bank_slip, Types::Coercible::String
  end
end
