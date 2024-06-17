# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Product do
  describe 'attributes' do
    subject(:product) { described_class }

    it { is_expected.to have_attribute(:active, Types::Bool) }
    it { is_expected.to have_attribute(:availability, Types::Coercible::String) }
    it { is_expected.to have_attribute(:brand, Types::String) }
    it { is_expected.to have_attribute(:description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:ean, Types::Coercible::String) }
    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:list_price, Types::Coercible::String) }
    it { is_expected.to have_attribute(:medias, Types::Array.of(Types::String)) }
    it { is_expected.to have_attribute(:parent_sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:price, Types::Coercible::String) }
    it { is_expected.to have_attribute(:reference, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller_name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:navigation_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:title, Types::Coercible::String) }
    it { is_expected.to have_attribute(:type, Types::Coercible::String) }
    it { is_expected.to have_attribute(:updated_at, Types::Coercible::String) }

    it do
      expect(product).to have_attribute(:attributes,
                                        Types::Array.of(MagazineLuizaRewardsV2::ProductAttribute))
    end

    it do
      expect(product).to have_attribute(:dimensions, MagazineLuizaRewardsV2::ProductDimension)
    end

    it do
      expect(product).to have_attribute(:bundles,
                                        Types::Array.of(MagazineLuizaRewardsV2::ProductBundle))
    end

    it do
      expect(product).to have_attribute(:categories,
                                        Types::Array.of(MagazineLuizaRewardsV2::Category))
    end

    it do
      expect(product).to have_attribute(:factsheet,
                                        Types::Array.of(MagazineLuizaRewardsV2::Factsheet))
    end
  end
end
