FactoryBot.define do
  factory :user do
    email 'test@test.com'
    password 'MyPassword12'
    password_confirmation 'MyPassword12'
  end

  factory :user_b do
    email 'test+123@test.com'
    password 'MyPassword12'
    password_confirmation 'MyPassword12'
  end
end
