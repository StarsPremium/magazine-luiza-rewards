# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Factsheet do
  describe 'attributes' do
    subject(:factsheet) { described_class }

    it { is_expected.to have_attribute(:display_name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:position, Types::Coercible::Integer) }
    it { is_expected.to have_attribute(:slug, Types::Coercible::String) }

    it do
      expect(factsheet).to have_attribute(:elements,
                                          Types::Array.of(MagazineLuizaRewards::FactsheetElement))
    end
  end
end
