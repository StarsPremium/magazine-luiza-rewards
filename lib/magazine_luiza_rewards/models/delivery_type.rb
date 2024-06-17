# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class DeliveryType < Dry::Struct
    attribute :time, Types::Integer
    attribute :type, Types::String
    attribute :description, Types::String
    attribute :package_id, Types::Coercible::String
    attribute :price, Types::Coercible::String
  end
end
