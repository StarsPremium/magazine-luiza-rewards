# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class DeliveryParameters < Dry::Struct
    attribute :provider, Types::Coercible::String
    attribute :recipient_name, Types::Coercible::String
    attribute :recipient_document, Types::Coercible::String
    attribute :pickup_store_id, Types::Coercible::Integer
  end
end
