# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Api::Freight do
  subject(:freight_api) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewards::Client.new(token) }

  describe '#calculate' do
    subject(:calculated) { freight_api.calculate(zip_code, cart_id) }

    context 'when successfull', vcr: { cassette_name: 'calculate_freight/successful' } do
      let(:zip_code) { '14302536' }
      let(:cart_id) { '3a77f5a9-bb54-4f57-af63-145d517d4d22' }

      it { expect(calculated).to be_a(MagazineLuizaRewards::CalculatedFreight) }
    end

    context 'when cart not found', vcr: { cassette_name: 'calculate_freight/not_found' } do
      let(:zip_code) { '14302536' }
      let(:cart_id) { '71555ff9-91c3-4264-9095-06a169117cb2' }

      it do
        expect { calculated }.to \
          raise_error(MagazineLuizaRewards::Exceptions::NotFoundError,
                      "Cart #{cart_id} does not exist")
      end
    end
  end

  describe '#estimate' do
    subject(:estimated) { freight_api.estimate(zip_code, sku, seller) }

    context 'when successfull', vcr: { cassette_name: 'estimated_freight/successful' } do
      let(:zip_code) { '39809800' }
      let(:sku) { '201661208' }
      let(:seller) { 'magazineluiza' }
      let(:delivery_type) { estimated.delivery_types.first }

      it { expect(estimated).to be_a(MagazineLuizaRewards::EstimatedFreight) }
      it { expect(estimated.sku).to eq(sku) }
      it { expect(estimated.seller).to eq(seller) }
      it { expect(estimated.delivery_types).to all(be_a(MagazineLuizaRewards::DeliveryType)) }
      it { expect(delivery_type.type).to eq('conventional') }
      it { expect(delivery_type.time).to eq(7) }
      it { expect(delivery_type.description).to eq('Entrega padrão') }
      it { expect(delivery_type.package_id).to eq('1') }
      it { expect(delivery_type.price).to eq('73.97') }
    end

    context 'when sku not found', vcr: { cassette_name: 'estimated_freight/sku_not_found' } do
      let(:zip_code) { '39809800' }
      let(:sku) { '201661209' }
      let(:seller) { 'magazineluiza' }

      it do
        expect { estimated }.to \
          raise_error(MagazineLuizaRewards::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end

    context 'when item out of stock', vcr: { cassette_name: 'estimated_freight/no_stock' } do
      let(:zip_code) { '39809800' }
      let(:sku) { '086094300' }
      let(:seller) { 'magazineluiza' }

      it do
        expect { estimated }.to \
          raise_error(MagazineLuizaRewards::Exceptions::BadRequestError,
                      'Item not available to region')
      end
    end
  end
end
