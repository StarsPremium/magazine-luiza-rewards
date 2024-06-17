# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class Pix < Dry::Struct
    attribute :image_base64, Types::Coercible::String
    attribute :link, Types::Coercible::String
    attribute :emv, Types::Coercible::String
    attribute :expiration_date, Types::Coercible::String
  end
end
