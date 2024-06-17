# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::CalculatedFreight do
  describe 'attributes' do
    subject(:calculated_freight) { described_class }

    it { is_expected.to have_attribute(:disclaimers, Types::Array.of(Types::Coercible::String)) }
    it { is_expected.to have_attribute(:deliveries, Types::Array.of(MagazineLuizaRewards::Delivery)) }

    it do
      expect(calculated_freight).to \
        have_attribute(:unavailable_deliveries,
                       Types::Array.of(MagazineLuizaRewards::UnavailableDelivery))
    end
  end
end
