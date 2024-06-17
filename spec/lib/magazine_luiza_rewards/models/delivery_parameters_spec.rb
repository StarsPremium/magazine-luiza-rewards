# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::DeliveryParameters do
  describe 'attributes' do
    subject(:delivery_parameters) { described_class }

    it { is_expected.to have_attribute(:provider, Types::Coercible::String) }
    it { is_expected.to have_attribute(:recipient_name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:recipient_document, Types::Coercible::String) }
    it { is_expected.to have_attribute(:pickup_store_id, Types::Coercible::Integer) }
  end
end
