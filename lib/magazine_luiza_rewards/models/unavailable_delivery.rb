# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class UnavailableDelivery < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :status, Types::Coercible::String
    attribute :status_message, Types::Coercible::String
    attribute :items, Types::Array.of(DeliveryItem)
  end
end
