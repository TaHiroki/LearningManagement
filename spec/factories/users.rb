FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password { 'password' }
    introduction { 'お試しです。' }
    delete_flag { '0' }
  end
end