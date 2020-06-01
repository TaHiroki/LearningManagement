FactoryBot.define do
  factory :subject do
    subject { '数学' }
    count { '15' }
    flag { '3' }
    user
  end
end