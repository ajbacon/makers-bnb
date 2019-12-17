def sign_in
  visit '/'
  click_on 'Login'
  fill_in 'Email Address', with: 'abacon@test.com'
  fill_in 'Password', with: 'pass1'
  click_on 'Log in'
end
