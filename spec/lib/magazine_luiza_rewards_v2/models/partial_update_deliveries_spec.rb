# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::PartialUpdateDeliveries do
  describe 'attributes' do
    subject(:partial_update_deliveries) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:modality, MagazineLuizaRewardsV2::Modality) }
  end
end
