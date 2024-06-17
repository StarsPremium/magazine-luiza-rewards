# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class ShippingContact < Dry::Struct
    attribute :phone_ddd, Types::Coercible::String
    attribute :phone_number, Types::Coercible::String
  end
end
