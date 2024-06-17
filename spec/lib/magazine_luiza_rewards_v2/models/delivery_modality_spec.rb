# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::DeliveryModality do
  describe 'attributes' do
    subject(:delivery_modality) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:amount, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:type, Types::Coercible::String) }
    it { is_expected.to have_attribute(:providers, Types::Array.of(Types::Coercible::String)) }
    it { is_expected.to have_attribute(:shipping_time, MagazineLuizaRewardsV2::ShippingTimeResponse) }
  end
end
