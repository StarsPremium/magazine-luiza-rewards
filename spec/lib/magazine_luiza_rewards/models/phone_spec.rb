# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Phone do
  describe 'attributes' do
    subject(:phone) { described_class }

    it { is_expected.to have_attribute(:area_code, Types::Coercible::String) }
    it { is_expected.to have_attribute(:number, Types::Coercible::String) }
  end
end
