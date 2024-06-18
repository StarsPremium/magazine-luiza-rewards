# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class AddressAdd < Dry::Struct
    attribute :alias, Types::Coercible::String
    attribute :name, Types::Coercible::String
    attribute :zip_code, Types::Coercible::String
    attribute :street, Types::Coercible::String
    attribute :district, Types::Coercible::String
    attribute :number, Types::Coercible::String
    attribute :complement, Types::Coercible::String
    attribute? :reference, Types::Coercible::String.optional
    attribute :city, Types::Coercible::String
    attribute :state, Types::Coercible::String
    attribute :area_code, Types::Coercible::String
    attribute :phone, Types::Coercible::String
  end
end
