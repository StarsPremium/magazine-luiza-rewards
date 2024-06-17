# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Order do
  describe 'attributes' do
    subject(:order) { described_class }

    it { is_expected.to have_attribute(:customer_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:shipping) }
    it { is_expected.to have_attribute(:shipping_total, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:product_total, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:created_at, Types::Coercible::String) }
    it { is_expected.to have_attribute(:total_amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:payments, MagazineLuizaRewardsV2::OrderPayment) }
    it { is_expected.to have_attribute(:items, Types::Array.of(MagazineLuizaRewardsV2::OrderItem)) }
    it { is_expected.to have_attribute(:display_order_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:bank_slip, Types::Coercible::String) }
  end
end
