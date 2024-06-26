# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class PaymentMethods < Dry::Struct
    attribute? :id, Types::Coercible::String
    attribute? :description, Types::Coercible::String
    attribute? :installment_plans, InstallmentPlans
  end
end
