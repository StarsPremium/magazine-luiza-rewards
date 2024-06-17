# frozen_string_literal: true

module MagazineLuizaRewards
  class FactsheetElementElement < Dry::Struct
    attribute? :is_html, Types::Bool
    attribute? :value, Types::Coercible::String
  end
end
