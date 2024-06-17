# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Address do
  describe 'attributes' do
    subject(:address) { described_class }

    it { is_expected.to have_attribute(:zip_code, Types::Coercible::String) }
    it { is_expected.to have_attribute(:street, Types::Coercible::String) }
    it { is_expected.to have_attribute(:district, Types::Coercible::String) }
    it { is_expected.to have_attribute(:number, Types::Coercible::String) }
    it { is_expected.to have_attribute(:complement, Types::Coercible::String) }
    it { is_expected.to have_attribute(:reference, Types::Coercible::String.optional) }
    it { is_expected.to have_attribute(:city, Types::Coercible::String) }
    it { is_expected.to have_attribute(:state, Types::Coercible::String) }
  end
end
