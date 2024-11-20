FactoryBot.define do
  factory :purchase_shipping_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '100-0001' }
    prefecture_id { 14 }
    city          { '千代田区' }
    address       { '千代田1-1' }
    phone_number  { '09012345678' }
    building_name { 'Edo Castle' }
  end
end
