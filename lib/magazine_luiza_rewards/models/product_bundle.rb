# frozen_string_literal: true

module MagazineLuizaRewards
  class ProductBundle < Dry::Struct
    attribute :brand, Types::Coercible::String
    attribute :price, Types::Coercible::String
    attribute :quantity, Types::Coercible::String
    attribute :reference, Types::Coercible::String
    attribute :sku, Types::Coercible::String
    attribute :title, Types::Coercible::String
  end
end
