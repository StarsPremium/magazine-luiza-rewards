# frozen_string_literal: true

module MagazineLuizaRewards
  class InstallmentPlans < Dry::Struct
    attribute :discount, Types::Coercible::String
    attribute :discount_amount, Types::Coercible::String
    attribute :installment, Types::Coercible::Integer
    attribute :installment_amount, Types::Coercible::String
    attribute :interest, Types::Coercible::String
    attribute :interest_amount, Types::Coercible::String
    attribute :total_amount, Types::Coercible::String
  end
end
