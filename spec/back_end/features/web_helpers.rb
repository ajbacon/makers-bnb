def sign_up
  visit '/'
  fill_in 'email address', with: 'abacon@test.com'
  fill_in 'password', with: 'pass1'
  fill_in 'password confirmation', with: 'pass1'
  click_on 'Sign up'
end

def sign_in
  visit '/'
  click_on 'Login'
  fill_in 'Email Address', with: 'abacon@test.com'
  fill_in 'Password', with: 'pass1'
  click_on 'Log in'
end

def list_test_space
  click_on 'List a Space'
  fill_in 'name', with: 'BIG HOUSE'
  fill_in 'description', with: "it's big.."
  fill_in 'price-per-night', with: '500'
  fill_in 'available-from', with: '01012020'
  fill_in 'available-to', with: '12122020'
  click_on 'List my Space'
end

def test_space
  Space.where(name: 'BIG HOUSE').first
end


def sign_up_user_2
  visit '/'
  fill_in 'email address', with: 'tuna@test.com'
  fill_in 'password', with: '12345'
  fill_in 'password confirmation', with: '12345'
  click_on 'Sign up'
end

def sign_in_user_2
  visit '/'
  click_on 'Login'
  fill_in 'Email Address', with: 'tuna@test.com'
  fill_in 'Password', with: '12345'
  click_on 'Log in'
end