# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Api::Products do
  subject(:api_products) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewardsV2::Client.new(token) }

  describe '#products' do
    subject(:products) { api_products.products(limit, page, filters) }

    let(:limit) { 10 }
    let(:page) { 1 }

    context 'when no filter is passed', vcr: { cassette_name: 'products/no_filter_list_request' } do
      let(:filters) { {} }

      it { expect(products).to be_a(Array) }
      it { expect(products).to all(be_a(MagazineLuizaRewardsV2::Product)) }
      it { expect(products.size).to eq(10) }
    end

    context 'when filter brand is passed', vcr: { cassette_name: 'products/filter_list_request' } do
      let(:filters) { { brand: 'apple' } }

      it { expect(products).to be_a(Array) }
      it { expect(products).to all(be_a(MagazineLuizaRewardsV2::Product)) }
      it { expect(products.map(&:brand)).to all(eq('Apple')) }
    end
  end

  describe '#product_info' do
    subject(:product_info) { api_products.product_info(sku, seller) }

    context 'when product exists', vcr: { cassette_name: 'products/info_request' } do
      let(:sku) { '229653300' }
      let(:seller) { 'magazineluiza' }

      it { expect(product_info).to be_a(MagazineLuizaRewardsV2::Product) }
      it { expect(product_info.sku).to eq(sku) }
      it { expect(product_info.seller_id).to eq(seller) }
    end

    context 'when product does not exist',
            vcr: { cassette_name: 'products/info_not_found_request' } do
      let(:sku) { '999_999' }
      let(:seller) { 'unknown' }

      it do
        expect { product_info }.to raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError)
      end
    end
  end

  describe '#pricing_and_availability' do
    subject(:pricing_and_availability) do
      api_products.pricing_and_availability([product], show_payment_methods: show_payment_methods)
    end

    let(:show_payment_methods) { false }

    context 'when product exists and show_payment_methods is false',
            vcr: { cassette_name: 'products/price_request_without_payment_methods' } do
      let(:product) do
        MagazineLuizaRewardsV2::Product.new(sku: '229653300', seller_id: 'magazineluiza')
      end

      it { expect(pricing_and_availability).to be_a(Array) }
      it { expect(pricing_and_availability.size).to eq(1) }
      it { expect(pricing_and_availability).to all(be_a(MagazineLuizaRewardsV2::ProductPrice)) }
    end

    describe 'when product exists and show_payment_methods is true',
             vcr: { cassette_name: 'products/price_request_with_payment_methods' } do
      let(:show_payment_methods) { true }
      let(:product) do
        MagazineLuizaRewardsV2::Product.new(sku: '229653300', seller_id: 'magazineluiza')
      end

      it { expect(pricing_and_availability).to be_a(Array) }
      it { expect(pricing_and_availability.size).to eq(1) }
      it { expect(pricing_and_availability).to all(be_a(MagazineLuizaRewardsV2::ProductPrice)) }
    end

    context 'when product does not exist and default object is returned',
            vcr: { cassette_name: 'products/price_not_found_request' } do
      let(:product) { MagazineLuizaRewardsV2::Product.new(sku: '999_999', seller_id: 'unknown') }
      let(:expected_response) do
        MagazineLuizaRewardsV2::ProductPrice.new(
          {
            sku: product.sku,
            seller_id: product.seller_id,
            availability: '',
            price: 0.0,
            list_price: 0.0,
            best_price: {},
            payment_methods: {}
          }
        )
      end

      it { expect(pricing_and_availability).to be_a(Array) }
      it { expect(pricing_and_availability.first).to eq(expected_response) }
    end
  end
end
