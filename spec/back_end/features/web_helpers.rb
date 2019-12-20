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

def one_week
  604800 # in seconds
end

def one_day
  86400 # in seconds
end

def tomorrow
  (Time.now + one_day).strftime('%Y-%m-%d')
end

def one_week_and_one_day_from_now
  (Time.now + one_week + one_day).strftime('%Y-%m-%d')
end

def list_test_space
  click_on 'List a Space'
  fill_in 'name', with: 'BIG HOUSE'
  fill_in 'description', with: "it's big.."
  fill_in 'price-per-night', with: '500'
  page.find('#available-from').set(tomorrow) # tomorrow
  page.find('#available-to').set(one_week_and_one_day_from_now) # 1 week and 1 day from today
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

def sign_up_user_3
  visit '/'
  fill_in 'email address', with: 'user3@test.com'
  fill_in 'password', with: '12345'
  fill_in 'password confirmation', with: '12345'
  click_on 'Sign up'
end

def request_space
  # click on the first listed space
  click_on 'BIG HOUSE'
  fill_in 'requested-date', with: '12122020'
  click_on 'Request to Book'
end
