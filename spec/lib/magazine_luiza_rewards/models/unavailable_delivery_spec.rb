# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::UnavailableDelivery do
  describe 'attributes' do
    subject(:unavailable_delivery) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:status, Types::Coercible::String) }
    it { is_expected.to have_attribute(:status_message, Types::Coercible::String) }

    it do
      expect(unavailable_delivery).to \
        have_attribute(:items, Types::Array.of(MagazineLuizaRewards::DeliveryItem))
    end
  end
end
