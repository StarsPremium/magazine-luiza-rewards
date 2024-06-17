# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class DeliveryItem < Dry::Struct
    attribute :sku, Types::Coercible::String
    attribute :quantity, Types::Coercible::Decimal
    attribute :seller, Types::Coercible::String
    attribute :seller_description, Types::Coercible::String
    attribute :bundle_sku, Types::Coercible::String
  end
end
