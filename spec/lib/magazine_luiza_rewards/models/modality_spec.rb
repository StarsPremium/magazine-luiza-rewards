# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Modality do
  describe 'attributes' do
    subject(:modality) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:type, Types::Coercible::String) }

    it do
      expect(modality).to have_attribute(:delivery_parameters,
                                         MagazineLuizaRewards::DeliveryParameters)
    end
  end
end
