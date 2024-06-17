# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::ProductPrice do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:seller_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:availability, Types::Coercible::String) }
    it { is_expected.to have_attribute(:list_price, Types::Coercible::String) }
    it { is_expected.to have_attribute(:price, Types::Coercible::String) }
    it { is_expected.to have_attribute(:best_price, MagazineLuizaRewardsV2::BestPrice) }
    it { is_expected.to have_attribute(:payment_methods, MagazineLuizaRewardsV2::PaymentMethods) }
  end
end
