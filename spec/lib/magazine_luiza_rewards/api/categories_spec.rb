# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Api::Categories do
  subject(:api_categories) { described_class.new(client) }

  let(:token) { 'fake-token' }
  let(:client) { MagazineLuizaRewardsV2::Client.new(token) }

  describe '#catgories', vcr: { cassette_name: 'categories/categories' } do
    subject(:categories) { api_categories.categories }

    it { expect(categories).to be_a(Array) }
    it { expect(categories).to all(be_a(MagazineLuizaRewardsV2::Category)) }
  end
end
