# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Category do
  describe 'attributes' do
    subject(:category) { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:name, Types::Coercible::String) }

    it do
      expect(category).to have_attribute(:sub_categories,
                                         Types::Array.of(MagazineLuizaRewards::SubCategory))
    end
  end
end
