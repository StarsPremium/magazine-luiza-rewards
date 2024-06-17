# frozen_string_literal: true

module MagazineLuizaRewards
  class ProductDimension < Dry::Struct
    attribute :depth, Types::Coercible::Float
    attribute :height, Types::Coercible::Float
    attribute :width, Types::Coercible::Float
    attribute :weight, Types::Coercible::Float
  end
end
