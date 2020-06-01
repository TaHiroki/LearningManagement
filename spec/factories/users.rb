FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@com' }
    first { 'nil' }
    introduction { '頑張ります！' }
    password { 'password' }
    delete_flag { '0' }
  end
end