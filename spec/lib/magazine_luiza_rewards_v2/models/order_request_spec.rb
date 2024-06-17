# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::OrderRequest do
  describe 'attributes' do
    subject(:order_request) { described_class }

    it { is_expected.to have_attribute(:cart_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:customer_ip_address, Types::Coercible::String) }
    it { is_expected.to have_attribute(:payment_method_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:installments, Types::Coercible::Integer) }
    it { is_expected.to have_attribute(:partner_order_id, Types::Coercible::String) }
    it { is_expected.to have_attribute(:payment_info, MagazineLuizaRewardsV2::PaymentInfo) }

    it do
      expect(order_request).to have_attribute(:shipping_reference_contact,
                                              MagazineLuizaRewardsV2::ShippingContact)
    end
  end
end
