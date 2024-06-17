# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Package < Dry::Struct
    attribute :price, Types::Coercible::Decimal
    attribute :delivery_time, Types::Coercible::String
    attribute :delivery_type_id, Types::Coercible::String
    attribute :delivery_type_description, Types::Coercible::String
    attribute :items, Types::Array.of(PackageItem)
    attribute :seller, Types::Coercible::String
    attribute :package_id, Types::Coercible::String
  end
end
