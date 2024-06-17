# frozen_string_literal: true

module MagazineLuizaRewards
  class Phone < Dry::Struct
    attribute :area_code, Types::Coercible::String
    attribute :number, Types::Coercible::String
  end
end
