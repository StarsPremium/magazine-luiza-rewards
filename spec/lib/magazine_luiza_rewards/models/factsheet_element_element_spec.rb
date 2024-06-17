# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::FactsheetElementElement do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:is_html, Types::Bool) }
    it { is_expected.to have_attribute(:value, Types::Coercible::String) }
  end
end
