FactoryBot.define do
  factory :user do
    email 'test@test.com'
    username 'Solene'
    password 'MyPassword12'
    password_confirmation 'MyPassword12'
  end

  # factory :user_b do
  #   email 'test+123@test.com'
  #   password 'MyPassword12'
  #   password_confirmation 'MyPassword12'
  # end

  # factory :user do |u|
  #   u.sequence(:email) { |n| "mike#{n}@awesome.com"}
  #   u.password "password123"
  #   u.password_confirmation "password123"
  # end
end
