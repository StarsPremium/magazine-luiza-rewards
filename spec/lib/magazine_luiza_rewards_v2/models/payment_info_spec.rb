# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::PaymentInfo do
  describe 'attributes' do
    subject(:payment_info) { described_class }

    it { is_expected.to have_attribute(:encrypted_credit_card, Types::Coercible::String) }
  end
end
