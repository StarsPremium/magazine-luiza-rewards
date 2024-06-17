# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Modality do
  describe 'attributes' do
    subject(:modality) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:type, Types::Coercible::String) }

    it do
      expect(modality).to have_attribute(:delivery_parameters,
                                         MagazineLuizaRewardsV2::DeliveryParameters)
    end
  end
end
