# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::ProductBundle do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:brand, Types::Coercible::String) }
    it { is_expected.to have_attribute(:price, Types::Coercible::String) }
    it { is_expected.to have_attribute(:quantity, Types::Coercible::String) }
    it { is_expected.to have_attribute(:reference, Types::Coercible::String) }
    it { is_expected.to have_attribute(:sku, Types::Coercible::String) }
    it { is_expected.to have_attribute(:title, Types::Coercible::String) }
  end
end
