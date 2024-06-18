# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Package do
  describe 'attributes' do
    subject(:package) { described_class }

    it { is_expected.to have_attribute(:price, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:delivery_time, Types::Coercible::String) }
    it { is_expected.to have_attribute(:delivery_type_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:delivery_type_description, Types::Coercible::String) }

    it do
      is_expected.to have_attribute(:items, Types::Array.of(MagazineLuizaRewardsV2::PackageItem))
    end

    it { is_expected.to have_attribute(:seller, Types::Coercible::String) }
    it { is_expected.to have_attribute(:package_id, Types::Coercible::String) }
  end
end
