# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class FactsheetElement < Dry::Struct
    attribute? :elements, Types::Array.of(FactsheetElementElement)
    attribute? :key_name, Types::Coercible::String
    attribute? :position, Types::Coercible::Integer
    attribute? :slug, Types::Coercible::String
  end
end
