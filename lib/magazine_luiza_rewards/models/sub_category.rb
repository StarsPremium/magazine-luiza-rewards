# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class SubCategory < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :name, Types::Coercible::String
  end
end
