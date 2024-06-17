# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Modality < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :type, Types::Coercible::String
    attribute? :delivery_parameters, DeliveryParameters
  end
end
