# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Customer do
  describe 'attributes' do
    subject(:customer) { described_class }

    it { is_expected.to have_attribute(:name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:email, Types::Coercible::String) }
    it { is_expected.to have_attribute(:document, Types::Coercible::String) }
    it { is_expected.to have_attribute(:birth_date, Types::Coercible::String) }
    it { is_expected.to have_attribute(:address, MagazineLuizaRewards::Address) }
    it { is_expected.to have_attribute(:phone, MagazineLuizaRewards::Phone) }
    it { is_expected.to have_attribute(:responsible_name, Types::Coercible::String.optional) }
    it { is_expected.to have_attribute(:state_inscription, Types::Coercible::String.optional) }
  end
end
