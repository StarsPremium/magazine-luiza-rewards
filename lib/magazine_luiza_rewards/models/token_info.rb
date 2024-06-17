# frozen_string_literal: true

module MagazineLuizaRewards
  class TokenInfo < Dry::Struct
    attribute :access_token, Types::Coercible::String
    attribute :expires_in, Types::Coercible::Integer
  end
end
