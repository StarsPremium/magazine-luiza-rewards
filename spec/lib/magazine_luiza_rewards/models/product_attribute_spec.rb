# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::ProductAttribute do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:type, Types::Coercible::String) }
    it { is_expected.to have_attribute(:value, Types::Coercible::String) }
  end
end
