FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    area_id { 2 }
    city { 'A市' }
    house_number { 'B町1丁目1−1' }
    building_name { 'Cハイツ' }
    phone { "1234567890" }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id {1}
    user_id {1}
  end
end
