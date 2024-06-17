# frozen_string_literal: true

module MagazineLuizaRewards
  class CalculatedFreight < Dry::Struct
    attribute :disclaimers, Types::Array.of(Types::Coercible::String)
    attribute :deliveries, Types::Array.of(Delivery)
    attribute :unavailable_deliveries, Types::Array.of(UnavailableDelivery)
  end
end
