# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::Api::Categories do
  subject(:api_categories) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewards::Client.new(token) }

  describe '#catgories', vcr: { cassette_name: 'categories/categories' } do
    subject(:categories) { api_categories.categories }

    it { expect(categories).to be_a(Array) }
    it { expect(categories).to all(be_a(MagazineLuizaRewards::Category)) }
  end
end
