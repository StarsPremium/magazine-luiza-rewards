# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::OrderItem do
  describe 'attributes' do
    subject(:order_item) { described_class }

    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller_sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:quantity, Types::Coercible::Integer) }
    it { is_expected.to have_attribute(:seller_description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:catalog_price, Types::Coercible::Decimal) }
  end
end
