# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Customer < Dry::Struct
    attribute :name, Types::Coercible::String
    attribute :email, Types::Coercible::String
    attribute :document, Types::Coercible::String
    attribute :birth_date, Types::Coercible::String
    attribute :address, Address
    attribute :phone, Phone
    attribute? :responsible_name, Types::Coercible::String.optional
    attribute? :state_inscription, Types::Coercible::String.optional
  end
end
