# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Delivery do
  describe 'attributes' do
    subject(:delivery) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:status, Types::Coercible::String) }
    it { is_expected.to have_attribute(:status_message, Types::Coercible::String) }
    it { is_expected.to have_attribute(:provider, Types::Coercible::String) }

    it do
      expect(delivery).to have_attribute(:items,
                                         Types::Array.of(MagazineLuizaRewardsV2::DeliveryItem))
    end

    it do
      expect(delivery).to have_attribute(:modalities,
                                         Types::Array.of(MagazineLuizaRewardsV2::DeliveryModality))
    end
  end
end
