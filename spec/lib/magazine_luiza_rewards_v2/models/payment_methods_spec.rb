# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::PaymentMethods do
  describe 'attributes' do
    subject(:payment_methods) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:description, Types::Coercible::String) }

    it do
      is_expected.to have_attribute(:installment_plans, MagazineLuizaRewardsV2::InstallmentPlans)
    end
  end
end
