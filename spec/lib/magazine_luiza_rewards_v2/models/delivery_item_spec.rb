# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::DeliveryItem do
  describe 'attributes' do
    subject(:delivery_item) { described_class }

    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:quantity, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:seller, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller_description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:bundle_sku, Types::Coercible::String) }
  end
end
