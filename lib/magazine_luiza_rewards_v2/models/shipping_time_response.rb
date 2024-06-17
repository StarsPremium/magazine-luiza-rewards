# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class ShippingTimeResponse < Dry::Struct
    attribute :unit, Types::Coercible::String
    attribute :min_value, Types::Coercible::Decimal
    attribute :max_value, Types::Coercible::Decimal
    attribute :description, Types::Coercible::String
    attribute :disclaimers, Types::Array.of(Types::Coercible::String)
  end
end
