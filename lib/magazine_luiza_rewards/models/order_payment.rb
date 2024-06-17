# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class OrderPayment < Dry::Struct
    attribute :payment_method_id, Types::Coercible::String
    attribute :payment_method_name, Types::Coercible::String
    attribute :number_of_installments, Types::Coercible::String
    attribute :amount, Types::Coercible::Decimal
    attribute :refunded_amount, Types::Coercible::Decimal
    attribute :installment_plan_description, Types::Coercible::String
    attribute :amount_per_installment, Types::Coercible::Decimal
    attribute :interest_rate, Types::Coercible::Decimal
    attribute :discount_rate, Types::Coercible::Decimal
    attribute :discount_amount, Types::Coercible::Decimal
    attribute :discount_description, Types::Coercible::String
    attribute :payment_url, Types::Coercible::String
    attribute :emv_response, Types::Coercible::String
    attribute :gateway_status_code, Types::Coercible::String
    attribute :pix, Pix
  end
end
