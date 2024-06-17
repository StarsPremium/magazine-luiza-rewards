# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Factsheet < Dry::Struct
    attribute? :display_name, Types::Coercible::String
    attribute? :elements, Types::Array.of(FactsheetElement)
    attribute? :position, Types::Coercible::Integer
    attribute? :slug, Types::Coercible::String
  end
end
