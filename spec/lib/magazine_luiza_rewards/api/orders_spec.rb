# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Api::Orders do
  subject(:order_api) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewards::Client.new(token) }

  describe '#create' do
    subject(:order) { order_api.create(order_request) }

    let(:order_request) do
      MagazineLuizaRewards::OrderRequest.new(
        cart_id: 'd2d0408c-f03e-480a-9b95-1c6bcadbb873',
        customer_ip_address: '127.0.0.1',
        payment_method_id: 'external',
        installments: 1,
        partner_order_id: 'XYZ123',
        shipping_reference_contact: MagazineLuizaRewards::ShippingContact.new(
          phone_ddd: '16',
          phone_number: '99999999'
        )
      )
    end

    context 'when successfull', vcr: { cassette_name: 'orders/create_successful' } do
      it { expect(order).to be_a(MagazineLuizaRewards::Order) }
      it { expect(order.customer_id).to eq('05940d85-a1b6-4652-9320-300f35ad9e8d') }
    end

    context 'when unsuccessfull', vcr: { cassette_name: 'orders/create_unsuccessful' } do
      let(:order_request) do
        MagazineLuizaRewards::OrderRequest.new(
          cart_id: 'd2d0408c-f03e-480a-9b95-1c6bcadbb872',
          customer_ip_address: '127.0.0.1',
          payment_method_id: 'external',
          installments: 1,
          partner_order_id: 'XYZ123',
          shipping_reference_contact: MagazineLuizaRewards::ShippingContact.new(
            phone_ddd: '16',
            phone_number: '99999999'
          )
        )
      end

      it do
        expect { order }.to \
          raise_error(MagazineLuizaRewards::Exceptions::NotFoundError,
                      'Cart d2d0408c-f03e-480a-9b95-1c6bcadbb872 does not exist')
      end
    end
  end
end
