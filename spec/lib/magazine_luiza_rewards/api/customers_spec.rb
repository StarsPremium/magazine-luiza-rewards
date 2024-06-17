# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Api::Customers do
  subject(:api_customers) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewardsV2::Client.new(token) }

  describe '#create' do
    subject(:create) { api_customers.create(customer) }

    let(:customer) do
      MagazineLuizaRewardsV2::Customer.new(
        name: 'John Doe',
        email: 'fulano@example.com',
        document: '33226126008',
        birth_date: '1990-01-01',
        address: MagazineLuizaRewardsV2::Address.new(
          zip_code: '12345678',
          street: 'Rua dos Afagafinhos',
          district: 'Centro',
          number: '0',
          complement: 'Apto 1',
          reference: 'Perto da padaria',
          city: 'São Paulo',
          state: 'SP'
        ),
        phone: MagazineLuizaRewardsV2::Phone.new(
          area_code: '11',
          number: '999999999'
        ),
        responsible_name: 'John Doe',
        state_inscription: '123456789'
      )
    end

    context 'when successful', vcr: { cassette_name: 'customers/successful' } do
      it { expect(create).to be_a(Hash) }
      it { expect(create[:id]).to eq('a6b461b7-09f4-4186-b700-040dfb72dd74') }
      it { expect(create[:address_id]).to eq('61627000-81cb-4ee2-b90c-97eb35198301') }
    end

    context 'when not successful', vcr: { cassette_name: 'customers/unsuccessful' } do
      let(:customer) do
        MagazineLuizaRewardsV2::Customer.new(
          name: 'John Doe',
          email: 'fulano@example.com',
          document: '12345678901',
          birth_date: '1990-01-01',
          address: MagazineLuizaRewardsV2::Address.new(
            zip_code: '12345678',
            street: 'Rua dos Afagafinhos',
            district: 'Centro',
            number: '0',
            complement: 'Apto 1',
            reference: 'Perto da padaria',
            city: 'São Paulo',
            state: 'SP'
          ),
          phone: MagazineLuizaRewardsV2::Phone.new(
            area_code: '11',
            number: '999999999'
          ),
          responsible_name: 'John Doe',
          state_inscription: '123456789'
        )
      end

      it do
        expect { create }.to raise_error(MagazineLuizaRewardsV2::Exceptions::BadRequestError,
                                         'INVALID DOCUMENT')
      end
    end
  end

  describe '#get' do
    subject(:get) { api_customers.get(document) }

    let(:document) { '33226126008' }

    context 'when successful', vcr: { cassette_name: 'customers/get_successful' } do
      it { expect(get).to be_a(Hash) }
      it { expect(get[:id]).to eq('a6b461b7-09f4-4186-b700-040dfb72dd74') }
    end

    context 'when not successful', vcr: { cassette_name: 'customers/get_unsuccessful' } do
      let(:document) { '21099723000' }

      it do
        expect { get }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end

  describe '#add_address' do
    subject(:add_address) { api_customers.add_address(customer_id, address_add) }

    let(:customer_id) { 'a6b461b7-09f4-4186-b700-040dfb72dd74' }
    let(:address_add) do
      MagazineLuizaRewardsV2::AddressAdd.new(
        alias: 'Casa2',
        name: 'Fulano de Tal',
        zip_code: '12345678',
        street: 'Rua dos Afogados',
        district: 'Centro',
        number: '1001',
        complement: 'Apto 1',
        reference: 'Perto do Bar',
        city: 'São Paulo',
        state: 'SP',
        area_code: '11',
        phone: '999999999'
      )
    end

    context 'when successful', vcr: { cassette_name: 'customers/add_address_successful' } do
      it { expect(add_address).to be_a(Hash) }
      it { expect(add_address[:id]).to eq('a24d3e58-e6e1-4173-8bfc-08ab2b839804') }
    end

    context 'when not successful', vcr: { cassette_name: 'customers/add_address_unsuccessful' } do
      let(:address_add) do
        MagazineLuizaRewardsV2::AddressAdd.new(
          alias: 'Casa 3',
          name: '',
          zip_code: '',
          street: 'Rua dos Canarios',
          district: 'Centro',
          number: '0',
          complement: 'Apto 1',
          reference: 'Perto da padaria',
          city: 'São Paulo',
          state: 'SP',
          area_code: '11',
          phone: '999999999'
        )
      end

      it do
        expect { add_address }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::UnprocessableEntityError,
                      'value is not a valid')
      end
    end
  end

  describe '#get_address' do
    subject(:get_address) do
      api_customers.get_address(customer_id, number, street, zip_code, complement)
    end

    let(:customer_id) { 'a6b461b7-09f4-4186-b700-040dfb72dd74' }
    let(:number) { '0' }
    let(:street) { 'Rua dos Afagafinhos' }
    let(:zip_code) { '12345678' }
    let(:complement) { 'Apto 1' }

    context 'when successful', vcr: { cassette_name: 'customers/get_address_successful' } do
      it { expect(get_address).to be_a(Hash) }
      it { expect(get_address[:id]).to eq('61627000-81cb-4ee2-b90c-97eb35198301') }
    end

    context 'when not successful', vcr: { cassette_name: 'customers/get_address_unsuccessful' } do
      let(:number) { '0' }
      let(:street) { 'Rua dos Canarios' }
      let(:zip_code) { '12345678' }
      let(:complement) { 'Apto 1' }

      it do
        expect { get_address }.to \
          raise_error(MagazineLuizaRewardsV2::Exceptions::NotFoundError,
                      'The server did not find the requested resource in the request')
      end
    end
  end
end
