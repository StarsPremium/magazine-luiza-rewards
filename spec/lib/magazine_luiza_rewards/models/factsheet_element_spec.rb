# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::FactsheetElement do
  describe 'attributes' do
    subject(:element) { described_class }

    it { is_expected.to have_attribute(:key_name, Types::Coercible::String) }
    it { is_expected.to have_attribute(:position, Types::Coercible::Integer) }
    it { is_expected.to have_attribute(:slug, Types::Coercible::String) }

    it do
      expect(element).to have_attribute(:elements,
                                        Types::Array.of(
                                          MagazineLuizaRewards::FactsheetElementElement
                                        ))
    end
  end
end
