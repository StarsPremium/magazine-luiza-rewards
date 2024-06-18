# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class DeliveryModality < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :name, Types::Coercible::String
    attribute :amount, Types::Coercible::Decimal
    attribute :type, Types::Coercible::String
    attribute :shipping_time, ShippingTimeResponse
    attribute :providers, Types::Array.of(Types::Coercible::String)
  end
end
