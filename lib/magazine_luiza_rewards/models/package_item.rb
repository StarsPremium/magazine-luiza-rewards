# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class PackageItem < Dry::Struct
    attribute :sku, Types::Coercible::String
    attribute :bundle_sku, Types::Coercible::String
    attribute :quantity, Types::Coercible::Decimal
  end
end
