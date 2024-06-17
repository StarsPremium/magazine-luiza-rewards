# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::BestPrice do
  describe 'attributes' do
    subject(:best_price) { described_class }

    it { is_expected.to have_attribute(:discount, Types::Coercible::String) }
    it { is_expected.to have_attribute(:payment_method_description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:payment_method_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:total_amount, Types::Coercible::String) }
  end
end
