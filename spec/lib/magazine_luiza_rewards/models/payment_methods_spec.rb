# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::PaymentMethods do
  describe 'attributes' do
    subject(:payment_methods) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:installment_plans, MagazineLuizaRewards::InstallmentPlans) }
  end
end
