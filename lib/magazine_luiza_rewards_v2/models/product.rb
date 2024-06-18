# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Product < Dry::Struct
    attribute? :active, Types::Bool
    attribute? :attributes, Types::Array.of(ProductAttribute)
    attribute? :availability, Types::Coercible::String
    attribute? :brand, Types::String
    attribute? :dimensions, ProductDimension
    attribute? :bundles, Types::Array.of(ProductBundle)
    attribute? :categories, Types::Array.of(Category)
    attribute? :description, Types::Coercible::String
    attribute? :ean, Types::Coercible::String
    attribute? :factsheet, Types::Array.of(Factsheet)
    attribute? :id, Types::Coercible::String
    attribute? :list_price, Types::Coercible::String
    attribute? :medias, Types::Array.of(Types::String)
    attribute? :parent_sku, Types::Coercible::String
    attribute? :price, Types::Coercible::String
    attribute? :reference, Types::Coercible::String
    attribute :seller_id, Types::Coercible::String
    attribute? :seller_name, Types::Coercible::String
    attribute :sku, Types::Coercible::String
    attribute? :navigation_id, Types::Coercible::String
    attribute? :title, Types::Coercible::String
    attribute? :type, Types::Coercible::String
    attribute? :updated_at, Types::Coercible::String
  end
end
