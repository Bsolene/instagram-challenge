def create_user_and_log_in
  create :user, email: 'user@test.com', password: 'password', password_confirmation: 'password'
  visit new_user_session_path
  fill_in :user_email, with: 'user@test.com'
  fill_in :user_password, with: 'password'
  click_on 'Log in'
end