FactoryBot.define do
  factory :user do
    user_name { 'test' }
    first_name { 'テスト' }
    last_name { '太郎' }
    first_name_kana { 'テスト' }
    last_name_kana { 'タロウ' }
    email { Faker::Internet.free_email }
    password { '123abc' }
    password_confirmation { password }
    birthday { '2000-01-01' }
  end
end
