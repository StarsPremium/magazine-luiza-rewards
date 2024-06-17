# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Client do
  subject(:client) { described_class.new }

  describe '#initialize' do
    it do
      expect(client.base_url).to eq(described_class::DEFAULT_BASE_URL)
    end
  end

  describe '#login' do
    subject(:login) { client.login(username, password) }

    let(:username) { 'user' }
    let(:password) { 'pass' }
    let(:token_info) { instance_double(MagazineLuizaRewardsV2::TokenInfo, access_token: 'abc') }
    let(:api) do
      instance_double(MagazineLuizaRewardsV2::Api::Authentication, generate_token: token_info)
    end

    before do
      allow(MagazineLuizaRewardsV2::Api::Authentication).to receive(:new).and_return(api)
      allow(api).to receive(:generate_token).with(username, password).and_return(token_info)
    end

    it do
      expect(login).to eq(token_info)
    end

    it do
      expect { login }.to change(client, :oauth_token).from(nil).to('abc')
    end
  end

  describe '#products' do
    subject(:products) { client.products(limit, page, filters) }

    let(:limit) { 10 }
    let(:page) { 1 }
    let(:filters) { {} }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Products, products: []) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Products).to receive(:new).and_return(api)
      allow(api).to receive(:products).with(limit, page, filters).and_return([])
    end

    it { expect(products).to be_empty }
  end

  describe '#product_info' do
    subject(:product_info) { client.product_info(sku, seller) }

    let(:sku) { '123' }
    let(:seller) { 'seller' }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Products, product_info: []) }
    let(:product) { instance_double(MagazineLuizaRewardsV2::Product) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Products).to receive(:new).and_return(api)
      allow(api).to receive(:product_info).with(sku, seller).and_return(product)
    end

    it { expect(product_info).to eq(product) }
  end

  describe '#pricing_and_availability' do
    subject(:pricing_and_availability) { client.pricing_and_availability(products, **options) }

    let(:products) { [MagazineLuizaRewardsV2::Product.new(sku: '123', seller_id: 'seller')] }
    let(:options) { { show_payment_methods: false } }
    let(:product_price) { instance_double(MagazineLuizaRewardsV2::ProductPrice) }
    let(:api) do
      instance_double(MagazineLuizaRewardsV2::Api::Products, pricing_and_availability: product_price)
    end

    before do
      allow(MagazineLuizaRewardsV2::Api::Products).to receive(:new).and_return(api)
      allow(api).to receive(:pricing_and_availability).with(products, **options)
                                                      .and_return(product_price)
    end

    it { expect(pricing_and_availability).to eq(product_price) }
  end

  describe '#create_cart' do
    subject(:create_cart) { client.create_cart(items) }

    let(:items) { [] }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Carts, create_cart: []) }
    let(:cart) { instance_double(MagazineLuizaRewardsV2::Cart) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Carts).to receive(:new).and_return(api)
      allow(api).to receive(:create_cart).with(items).and_return(cart)
    end

    it { expect(create_cart).to eq(cart) }
  end

  describe '#get_cart' do
    subject(:get_cart) { client.get_cart(cart_id) }

    let(:cart_id) { '123' }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Carts, get_cart: []) }
    let(:cart) { instance_double(MagazineLuizaRewardsV2::Cart) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Carts).to receive(:new).and_return(api)
      allow(api).to receive(:get_cart).with(cart_id).and_return(cart)
    end

    it { expect(get_cart).to eq(cart) }
  end

  describe '#update_cart' do
    subject(:update_cart) { client.update_cart(cart) }

    let(:cart) { instance_double(MagazineLuizaRewardsV2::Cart) }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Carts, update_cart: []) }
    let(:updated_cart) { instance_double(MagazineLuizaRewardsV2::Cart) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Carts).to receive(:new).and_return(api)
      allow(api).to receive(:update_cart).with(cart).and_return(updated_cart)
    end

    it { expect(update_cart).to eq(updated_cart) }
  end

  describe '#add_item_to_cart' do
    subject(:add_item_to_cart) { client.add_item_to_cart(cart_id, item) }

    let(:cart_id) { '123' }
    let(:item) { instance_double(MagazineLuizaRewardsV2::CartItem) }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Carts, add_item_to_cart: updated_cart) }
    let(:updated_cart) { instance_double(MagazineLuizaRewardsV2::Cart) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Carts).to receive(:new).and_return(api)
      allow(api).to receive(:add_item).with(cart_id, item).and_return(updated_cart)
    end

    it { expect(add_item_to_cart).to eq(updated_cart) }
  end

  describe '#update_item_quantity' do
    subject(:update_item_quantity) { client.update_item_quantity(cart_id, item) }

    let(:cart_id) { '123' }
    let(:item) { instance_double(MagazineLuizaRewardsV2::CartItem) }
    let(:api) do
      instance_double(MagazineLuizaRewardsV2::Api::Carts, update_item_quantity: updated_cart)
    end
    let(:updated_cart) { instance_double(MagazineLuizaRewardsV2::Cart) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Carts).to receive(:new).and_return(api)
      allow(api).to receive(:update_item_quantity).with(cart_id, item).and_return(updated_cart)
    end

    it { expect(update_item_quantity).to eq(updated_cart) }
  end

  describe '#remove_item_from_cart' do
    subject(:remove_item_from_cart) { client.remove_item_from_cart(cart_id, item) }

    let(:cart_id) { '123' }
    let(:item) { instance_double(MagazineLuizaRewardsV2::CartItem) }
    let(:updated_cart) { instance_double(MagazineLuizaRewardsV2::Cart) }
    let(:api) do
      instance_double(MagazineLuizaRewardsV2::Api::Carts, remove_item_from_cart: updated_cart)
    end

    before do
      allow(MagazineLuizaRewardsV2::Api::Carts).to receive(:new).and_return(api)
      allow(api).to receive(:remove_item).with(cart_id, item).and_return(updated_cart)
    end

    it { expect(remove_item_from_cart).to eq(updated_cart) }
  end

  describe '#create_customer' do
    subject(:create_customer) { client.create_customer(customer) }

    let(:customer) { instance_double(MagazineLuizaRewardsV2::Customer) }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Customers, create_customer: []) }
    let(:created_customer) { instance_double(MagazineLuizaRewardsV2::Customer) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Customers).to receive(:new).and_return(api)
      allow(api).to receive(:create_customer).with(customer).and_return(created_customer)
    end

    it { expect(create_customer).to eq(created_customer) }
  end

  describe '#get_customer' do
    subject(:get_customer) { client.get_customer(customer_id) }

    let(:customer_id) { '123' }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Customers, get_customer: []) }
    let(:customer) { instance_double(MagazineLuizaRewardsV2::Customer) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Customers).to receive(:new).and_return(api)
      allow(api).to receive(:get_customer).with(customer_id).and_return(customer)
    end

    it { expect(get_customer).to eq(customer) }
  end

  describe '#add_customer_address' do
    subject(:add_customer_address) { client.add_customer_address(customer_id, address) }

    let(:customer_id) { '123' }
    let(:address) { instance_double(MagazineLuizaRewardsV2::Address) }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Customers, add_customer_address: []) }
    let(:customer) { instance_double(MagazineLuizaRewardsV2::Customer) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Customers).to receive(:new).and_return(api)
      allow(api).to receive(:add_customer_address).with(customer_id, address).and_return(customer)
    end

    it { expect(add_customer_address).to eq(customer) }
  end

  describe '#get_customer_address' do
    subject(:get_customer_address) do
      client.get_customer_address(customer_id, number, street, zip_code)
    end

    let(:customer_id) { '123' }
    let(:number) { '456' }
    let(:street) { 'street' }
    let(:zip_code) { '789' }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Customers, get_customer_address: []) }
    let(:address) { instance_double(MagazineLuizaRewardsV2::Address) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Customers).to receive(:new).and_return(api)
      allow(api).to receive(:get_customer_address).with(customer_id, number, street, zip_code)
                                                  .and_return(address)
    end

    it { expect(get_customer_address).to eq(address) }
  end

  describe '#estimate_freight' do
    subject(:estimate_freight) { client.estimate_freight(zip_code, sku, seller) }

    let(:zip_code) { '123' }
    let(:sku) { '456' }
    let(:seller) { 'seller' }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Freight, estimate: []) }
    let(:estimated_freight) { instance_double(MagazineLuizaRewardsV2::EstimatedFreight) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Freight).to receive(:new).and_return(api)
      allow(api).to receive(:estimate_freight).with(zip_code, sku,
                                                    seller).and_return(estimated_freight)
    end

    it { expect(estimate_freight).to eq(estimated_freight) }
  end

  describe '#calculate_freight' do
    subject(:calculate_freight) { client.calculate_freight(zip_code, cart_id) }

    let(:zip_code) { '123' }
    let(:cart_id) { '456' }
    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Freight, calculate: []) }
    let(:calculated_freight) { instance_double(MagazineLuizaRewardsV2::CalculatedFreight) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Freight).to receive(:new).and_return(api)
      allow(api).to receive(:calculate_freight).with(zip_code, cart_id)
                                               .and_return(calculated_freight)
    end

    it { expect(calculate_freight).to eq(calculated_freight) }
  end

  describe '#categories' do
    subject(:categories) { client.categories }

    let(:api) { instance_double(MagazineLuizaRewardsV2::Api::Categories, categories: []) }
    let(:category) { instance_double(MagazineLuizaRewardsV2::Category) }

    before do
      allow(MagazineLuizaRewardsV2::Api::Categories).to receive(:new).and_return(api)
      allow(api).to receive(:categories).and_return([category])
    end

    it { expect(categories).to eq([category]) }
  end
end
