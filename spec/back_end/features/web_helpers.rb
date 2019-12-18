def sign_in
  visit '/'
  click_on 'Login'
  fill_in 'Email Address', with: 'abacon@test.com'
  fill_in 'Password', with: 'pass1'
  click_on 'Log in'
end

def sign_up
  visit '/'
  fill_in 'email address', with: 'abacon@test.com'
  fill_in 'password', with: 'pass1'
  fill_in 'password confirmation', with: 'pass1'
  click_on 'Sign up'
end
