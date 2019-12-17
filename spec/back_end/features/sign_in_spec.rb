feature 'sign in' do

  scenario 'a user clicks on the Log in button on home page' do
    visit '/'
    click_on 'Login'

    expect(page).to have_current_path '/sessions/new'
    expect(page).to have_content 'Email Address'
    expect(page).to have_content 'Password'
  end

  scenario 'a user sucessfully signs in' do
    sign_up
    sign_in

    expect(page).to have_content 'Book a Space'
    expect(page).to have_current_path '/spaces'
  end

  scenario 'a user fails to sign in because of wrong email address' do
    visit '/'
    click_on 'Login'
    fill_in 'Email Address', with: 'wrong@test.com'
    fill_in 'Password', with: 'pass1'
    click_on 'Log in'

    expect(page).to have_current_path '/sessions/new'
  end

  scenario 'a user fails to sign in because of wrong password' do
    visit '/'
    click_on 'Login'
    fill_in 'Email Address', with: 'abacon@test.com'
    fill_in 'Password', with: 'notpass1'
    click_on 'Log in'

    expect(page).to have_current_path '/sessions/new'
  end
end
