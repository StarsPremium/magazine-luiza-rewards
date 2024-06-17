# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::PackageItem do
  describe 'attributes' do
    subject(:package_item) { described_class }

    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:bundle_sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:quantity, Types::Coercible::Decimal) }
  end
end
