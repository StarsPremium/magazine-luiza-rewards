# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class PartialUpdateDeliveries < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :modality, Modality
  end
end
