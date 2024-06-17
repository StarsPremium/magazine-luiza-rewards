# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Api::Carts do
  subject(:api_carts) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewardsV2::Client.new(token) }

  describe '#create' do
    subject(:cart) { api_carts.create(items) }

    let(:sku) { '200487300' }
    let(:items) do
      [MagazineLuizaRewardsV2::CartItem.new(sku: sku, seller: 'magazineluiza', quantity: 1)]
    end

    context 'when successfull', vcr: { cassette_name: 'carts/successful' } do
      it { expect(cart).to be_a(MagazineLuizaRewardsV2::Cart) }
      it { expect(cart.items.first.sku).to eq('200487300') }
      it { expect(cart.items.first.seller).to eq('magazineluiza') }
      it { expect(cart.items.first.quantity).to eq(1) }
      it { expect(cart.items.first.subtotal).to eq(cart.items.first.list_price * 1) }
      it { expect(cart.total_amount).to eq(cart.items.sum(&:subtotal)) }
    end

    context 'when item not found', vcr: { cassette_name: 'carts/not_found' } do
      let(:sku) { 'invalid' }

      it do
        expect { cart }.to raise_error(MagazineLuizaRewardsV2::Exceptions::BadRequestError,
                                       'Item Not Found')
      end
    end
  end

  describe '#get' do
    subject(:cart) { api_carts.get(card_id) }

    let(:card_id) { '71555ff9-91c3-4264-9095-06a169117cb3' }

    context 'when successfull', vcr: { cassette_name: 'carts/get_successful' } do
      it { expect(cart).to be_a(MagazineLuizaRewardsV2::Cart) }
      it { expect(cart.items.first.sku).to eq('200487300') }
      it { expect(cart.items.first.seller).to eq('magazineluiza') }
      it { expect(cart.items.first.quantity).to eq(1) }
      it { expect(cart.items.first.subtotal).to eq(cart.items.first.list_price * 1) }
      it { expect(cart.total_amount).to eq(cart.items.sum(&:subtotal)) }
    end

    context 'when card not found', vcr: { cassette_name: 'carts/get_not_found' } do
      let(:card_id) { 'fb8b28de-62ab-11ee-8c99-0242ac120002' }

      it do
        expect { cart }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end

  describe '#update' do
    subject(:update) { api_carts.update(cart) }

    let(:card_id) { '71555ff9-91c3-4264-9095-06a169117cb3' }
    let(:cart) do
      MagazineLuizaRewardsV2::Cart.new(
        id: card_id,
        shipping_address_id: '61627000-81cb-4ee2-b90c-97eb35198301',
        customer_id: 'a6b461b7-09f4-4186-b700-040dfb72dd74',
        deliveries: [
          MagazineLuizaRewardsV2::PartialUpdateDeliveries.new(
            id: '55956efe-ffba-41bf-a073-df43c4483d54-1',
            modality: MagazineLuizaRewardsV2::Modality.new(
              id: '1',
              type: 'conventional'
            )
          )
        ]
      )
    end

    context 'when successfull', vcr: { cassette_name: 'carts/update_successful' } do
      it { expect(update).to be_a(MagazineLuizaRewardsV2::Cart) }
      it { expect(update.shipping_address_id).to eq('61627000-81cb-4ee2-b90c-97eb35198301') }
      it { expect(update.customer_id).to eq('a6b461b7-09f4-4186-b700-040dfb72dd74') }
      it { expect(update.billing_address_id).to eq('61627000-81cb-4ee2-b90c-97eb35198301') }
    end

    context 'when card not found', vcr: { cassette_name: 'carts/update_not_found' } do
      let(:card_id) { 'fb8b28de-62ab-11ee-8c99-0242ac120002' }

      it do
        expect { update }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end

  describe '#add_item' do
    subject(:add_item) { api_carts.add_item(card_id, item) }

    let(:card_id) { '71555ff9-91c3-4264-9095-06a169117cb3' }
    let(:sku) { '145855500' }
    let(:item) do
      MagazineLuizaRewardsV2::CartItem.new(sku: sku, seller: 'magazineluiza', quantity: 1)
    end

    context 'when successfull', vcr: { cassette_name: 'carts/add_item_successful' } do
      it { expect(add_item).to be_a(MagazineLuizaRewardsV2::Cart) }
      it { expect(add_item.items.map(&:sku)).to include('145855500') }
    end

    context 'when item not found', vcr: { cassette_name: 'carts/add_item_not_found' } do
      let(:sku) { 'invalid' }

      it do
        expect { add_item }.to raise_error(MagazineLuizaRewardsV2::Exceptions::BadRequestError,
                                           'Item Not Found')
      end
    end

    context 'when card not found', vcr: { cassette_name: 'carts/add_item_card_not_found' } do
      let(:card_id) { 'fb8b28de-62ab-11ee-8c99-0242ac120002' }

      it do
        expect { add_item }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end

  describe '#update_item_quantity' do
    subject(:update_item_quantity) { api_carts.update_item_quantity(card_id, item) }

    let(:card_id) { '71555ff9-91c3-4264-9095-06a169117cb3' }
    let(:sku) { '200487300' }
    let(:item) do
      MagazineLuizaRewardsV2::CartItem.new(sku: sku, seller: 'magazineluiza', quantity: 2)
    end
    let(:updated_item) { update_item_quantity.items.find { |i| i.sku == sku } }

    context 'when successfull', vcr: { cassette_name: 'carts/update_item_quantity_successful' } do
      it { expect(update_item_quantity).to be_a(MagazineLuizaRewardsV2::Cart) }
      it { expect(updated_item.quantity).to eq(2) }
    end

    context 'when item not found', vcr: { cassette_name: 'carts/update_item_quantity_not_found' } do
      let(:sku) { 'invalid' }

      it do
        expect { update_item_quantity }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'Item Not Found')
      end
    end

    context 'when card not found',
            vcr: { cassette_name: 'carts/update_item_quantity_card_not_found' } do
      let(:card_id) { 'fb8b28de-62ab-11ee-8c99-0242ac120002' }

      it do
        expect { update_item_quantity }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end

  describe '#remove_item' do
    subject(:remove_item) { api_carts.remove_item(card_id, item) }

    let(:card_id) { '71555ff9-91c3-4264-9095-06a169117cb3' }
    let(:sku) { '200487300' }
    let(:item) do
      MagazineLuizaRewardsV2::CartItem.new(sku: sku, seller: 'magazineluiza')
    end

    context 'when successfull', vcr: { cassette_name: 'carts/remove_item_successful' } do
      it { expect(remove_item).to be_a(MagazineLuizaRewardsV2::Cart) }
      it { expect(remove_item.items.map(&:sku)).not_to include('200487300') }
    end

    context 'when item not found', vcr: { cassette_name: 'carts/remove_item_not_found' } do
      let(:sku) { 'invalid' }

      it do
        expect { remove_item }.to raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                                              'Item Not Found')
      end
    end

    context 'when card not found', vcr: { cassette_name: 'carts/remove_item_card_not_found' } do
      let(:card_id) { 'fb8b28de-62ab-11ee-8c99-0242ac120002' }

      it do
        expect { remove_item }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end
end
