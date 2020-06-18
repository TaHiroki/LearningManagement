FactoryBot.define do
  factory :subject do
    subject { '英語' }
    count { '10' }
    flag { '5' }
    user
  end
end