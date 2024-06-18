# frozen_string_literal: true

module MagazineLuizaRewardsV2
  class TokenInfo < Dry::Struct
    attribute :access_token, Types::Coercible::String
    attribute :expires_in, Types::Coercible::Integer
  end
end
