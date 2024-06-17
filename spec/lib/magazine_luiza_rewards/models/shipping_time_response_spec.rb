# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::ShippingTimeResponse do
  describe 'attributes' do
    subject(:shipping_time_response) { described_class }

    it { is_expected.to have_attribute(:unit, Types::Coercible::String) }
    it { is_expected.to have_attribute(:min_value, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:max_value, Types::Coercible::Decimal) }
    it { is_expected.to have_attribute(:description, Types::Coercible::String) }
    it { is_expected.to have_attribute(:disclaimers, Types::Array.of(Types::Coercible::String)) }
  end
end
