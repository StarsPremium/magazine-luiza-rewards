# frozen_string_literal: true

module MagazineLuizaRewards
  class OrderRequest < Dry::Struct
    attribute :cart_id, Types::Coercible::String
    attribute :customer_ip_address, Types::Coercible::String
    attribute :payment_method_id, Types::Coercible::String
    attribute :installments, Types::Coercible::Integer
    attribute :partner_order_id, Types::Coercible::String
    attribute :shipping_reference_contact, ShippingContact
    attribute? :payment_info, PaymentInfo
  end
end
