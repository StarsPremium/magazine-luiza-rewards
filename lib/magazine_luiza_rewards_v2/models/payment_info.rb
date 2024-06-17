# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class PaymentInfo < Dry::Struct
    attribute :encrypted_credit_card, Types::Coercible::String
  end
end
