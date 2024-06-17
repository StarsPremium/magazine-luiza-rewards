# frozen_string_literal: true

module MagazineLuizaRewards
  class BestPrice < Dry::Struct
    attribute? :discount, Types::Coercible::String
    attribute? :payment_method_description, Types::Coercible::String
    attribute? :payment_method_id, Types::Coercible::String
    attribute? :total_amount, Types::Coercible::String
  end
end
