FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    area_id { 2 }
    city { 'A市' }
    house_number { 'B町1丁目1−1' }
    building_name { 'Cハイツ' }
    phone { 1_234_567_890 }
  end
end
