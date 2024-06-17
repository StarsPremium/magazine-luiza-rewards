# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class ProductAttribute < Dry::Struct
    attribute :type, Types::Coercible::String
    attribute :value, Types::Coercible::String
  end
end
