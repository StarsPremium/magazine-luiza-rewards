# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Category < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :name, Types::Coercible::String
    attribute :sub_categories, Types::Array.of(SubCategory)
  end
end
