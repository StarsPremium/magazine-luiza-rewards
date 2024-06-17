# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::OrderPayment do
  describe 'attributes' do
    subject(:order_payment) { described_class }

    it { is_expected.to have_attribute(:payment_method_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:payment_method_name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:number_of_installments, Types::Coercible::String) }
    it { is_expected.to have_attribute(:amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:refunded_amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:installment_plan_description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:amount_per_installment, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:interest_rate, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:discount_rate, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:discount_amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:discount_description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:payment_url, Types::Coercible::String) }
    it { is_expected.to have_attribute(:emv_response, Types::Coercible::String) }
    it { is_expected.to have_attribute(:gateway_status_code, Types::Coercible::String) }
    it { is_expected.to have_attribute(:pix, MagazineLuizaRewards::Pix) }
  end
end
