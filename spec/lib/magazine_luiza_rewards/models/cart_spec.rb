# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Cart do
  describe 'attributes' do
    subject(:cart) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:items, Types::Array.of(MagazineLuizaRewards::CartItem)) }
    it { is_expected.to have_attribute(:promocode, Types::Coercible::String) }
    it { is_expected.to have_attribute(:total_amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:total_best_amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:customer_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:billing_address_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:shipping_address_id, Types::Coercible::String) }

    it do
      expect(cart).to \
        have_attribute(:deliveries, Types::Array.of(MagazineLuizaRewards::PartialUpdateDeliveries))
    end
  end
end
