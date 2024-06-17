# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::CartItem do
  describe 'attributes' do
    subject(:cart_item) { described_class }

    it { is_expected.to have_attribute(:list_price, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:price, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:best_price, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:quantity, Types::Coercible::Integer) }
    it { is_expected.to have_attribute(:seller, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller_description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:subtotal, Types::Coercible::Decimal) }
  end
end
