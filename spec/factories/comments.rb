FactoryBot.define do
  factory :comment do
    comment { 'テストコメント' }
    user
  end
end