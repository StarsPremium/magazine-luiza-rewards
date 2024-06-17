# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::SubCategory do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:name, Types::Coercible::String) }
  end
end
