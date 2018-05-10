FactoryBot.define do
  factory :comment do
    comment 'Heeyyy :)'
    association :post, factory: :post
  end
end
