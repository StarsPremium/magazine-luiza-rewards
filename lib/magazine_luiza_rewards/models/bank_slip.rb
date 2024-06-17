# frozen_string_literal: true

module MagazineLuizaRewards
  class BankSlip < Dry::Struct
    attribute :our_number, Types::Coercible::String
    attribute :doc_number, Types::Coercible::String
    attribute :expiration, Types::Coercible::String
    attribute :created_at, Types::Coercible::String
    attribute :date_process, Types::Coercible::String
    attribute :total_amount, Types::Coercible::String
    attribute :barcode_number, Types::Coercible::String
  end
end
