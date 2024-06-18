# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MagazineLuizaRewardsV2::Pix do
  describe 'attributes' do
    subject(:pix) { described_class }

    it { is_expected.to have_attribute(:image_base64, Types::Coercible::String) }
    it { is_expected.to have_attribute(:link, Types::Coercible::String) }
    it { is_expected.to have_attribute(:emv, Types::Coercible::String) }
    it { is_expected.to have_attribute(:expiration_date, Types::Coercible::String) }
  end
end
