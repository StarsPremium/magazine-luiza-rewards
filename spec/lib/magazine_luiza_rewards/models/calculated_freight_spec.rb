# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::CalculatedFreight do
  describe 'attributes' do
    subject(:calculated_freight) { described_class }

    it { is_expected.to have_attribute(:disclaimers, Types::Array.of(Types::Coercible::String)) }
    it { is_expected.to have_attribute(:deliveries, Types::Array.of(MagazineLuizaRewardsV2::Delivery)) }

    it do
      expect(calculated_freight).to \
        have_attribute(:unavailable_deliveries,
                       Types::Array.of(MagazineLuizaRewardsV2::UnavailableDelivery))
    end
  end
end
