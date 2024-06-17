# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::ShippingContact do
  describe 'attributes' do
    subject(:shipping_contact) { described_class }

    it { is_expected.to have_attribute(:phone_ddd, Types::Coercible::String) }
    it { is_expected.to have_attribute(:phone_number, Types::Coercible::String) }
  end
end
