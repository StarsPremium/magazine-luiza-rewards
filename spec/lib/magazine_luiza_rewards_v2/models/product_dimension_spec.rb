# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::ProductDimension do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:depth, Types::Coercible::Float) }
    it { is_expected.to have_attribute(:height, Types::Coercible::Float) }
    it { is_expected.to have_attribute(:width, Types::Coercible::Float) }
    it { is_expected.to have_attribute(:weight, Types::Coercible::Float) }
  end
end
