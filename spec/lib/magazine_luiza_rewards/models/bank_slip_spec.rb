# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::BankSlip do
  describe 'attributes' do
    subject(:bank_slip) { described_class }

    it { is_expected.to have_attribute(:our_number, Types::Coercible::String) }
    it { is_expected.to have_attribute(:doc_number, Types::Coercible::String) }
    it { is_expected.to have_attribute(:expiration, Types::Coercible::String) }
    it { is_expected.to have_attribute(:created_at, Types::Coercible::String) }
    it { is_expected.to have_attribute(:date_process, Types::Coercible::String) }
    it { is_expected.to have_attribute(:total_amount, Types::Coercible::String) }
    it { is_expected.to have_attribute(:barcode_number, Types::Coercible::String) }
  end
end
