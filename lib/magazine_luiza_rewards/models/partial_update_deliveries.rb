# frozen_string_literal: true

module MagazineLuizaRewards
  class PartialUpdateDeliveries < Dry::Struct
    attribute :id, Types::Coercible::String
    attribute :modality, Modality
  end
end
