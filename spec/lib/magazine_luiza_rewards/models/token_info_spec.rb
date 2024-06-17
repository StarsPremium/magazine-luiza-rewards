# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewards::TokenInfo do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:access_token, Types::Coercible::String) }
    it { is_expected.to have_attribute(:expires_in, Types::Coercible::Integer) }
  end
end
