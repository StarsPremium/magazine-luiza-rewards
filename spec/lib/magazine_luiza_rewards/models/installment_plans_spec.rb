# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::InstallmentPlans do
  describe 'attributes' do
    subject(:installment_plans) { described_class }

    it { is_expected.to have_attribute(:discount, Types::Coercible::String) }
    it { is_expected.to have_attribute(:discount_amount, Types::Coercible::String) }
    it { is_expected.to have_attribute(:installment, Types::Coercible::Integer) }
    it { is_expected.to have_attribute(:installment_amount, Types::Coercible::String) }
    it { is_expected.to have_attribute(:interest, Types::Coercible::String) }
    it { is_expected.to have_attribute(:interest_amount, Types::Coercible::String) }
    it { is_expected.to have_attribute(:total_amount, Types::Coercible::String) }
  end
end
