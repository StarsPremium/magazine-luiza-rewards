# frozen_string_literal: true

module MagazineLuizaRewards
  class EstimatedFreight < Dry::Struct
    attribute :sku, Types::String
    attribute :seller, Types::String
    attribute :delivery_types, Types::Array.of(DeliveryType)
  end
end
