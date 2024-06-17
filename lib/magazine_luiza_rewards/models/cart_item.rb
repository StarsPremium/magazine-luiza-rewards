# frozen_string_literal: true

module MagazineLuizaRewards
  class CartItem < Dry::Struct
    attribute? :list_price, Types::Coercible::Decimal
    attribute? :price, Types::Coercible::Decimal
    attribute? :best_price, Types::Coercible::Decimal
    attribute? :quantity, Types::Coercible::Integer
    attribute :seller, Types::Coercible::String
    attribute? :seller_description, Types::Coercible::String
    attribute :sku, Types::Coercible::String
    attribute? :subtotal, Types::Coercible::Decimal
  end
end
