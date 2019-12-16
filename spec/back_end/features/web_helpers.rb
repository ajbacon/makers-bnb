def sign_up
  visit '/'
  click_on 'Sign Up'
  fill_in 'first-name', with: 'Andrew'
  fill_in 'surname', with: 'Bacon'
  fill_in 'email', with: 'abacon@test.com'
  fill_in 'password', with: 'pass1'
  fill_in 'confirm-password', with: 'pass1'
  click_on 'Create Account'
end

def sign_in
  visit '/'
  fill_in 'email', with: 'abacon@test.com'
  fill_in 'password', with: 'pass1'
  click_on 'Sign In'
end
