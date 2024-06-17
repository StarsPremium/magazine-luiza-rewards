# frozen_string_literal: true

module MagazineLuizaRewards
  class SubCategory < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :name, Types::Coercible::String
  end
end
