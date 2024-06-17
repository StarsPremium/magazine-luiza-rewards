# frozen_string_literal: true

module MagazineLuizaRewards
  class ProductAttribute < Dry::Struct
    attribute :type, Types::Coercible::String
    attribute :value, Types::Coercible::String
  end
end
