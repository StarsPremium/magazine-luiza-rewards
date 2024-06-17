# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::DeliveryType do
  describe 'attributes' do
    subject(:delivery_type) { described_class }

    it { is_expected.to have_attribute(:time, Types::Integer) }
    it { is_expected.to have_attribute(:type, Types::String) }
    it { is_expected.to have_attribute(:description, Types::String) }
    it { is_expected.to have_attribute(:package_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:price, Types::Coercible::String) }
  end
end
