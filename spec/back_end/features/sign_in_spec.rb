feature 'sign in' do
  scenario 'a user clicks on the Log in button on home page' do
    sign_up
    click_on 'Login'

    expect(page).to have_current_path '/sessions/new'
    expect(page).to have_content 'Email Address'
    expect(page).to have_content 'Password'
  end

  scenario 'a user signs up' do
    sign_up
    click_on 'Login'
    fill_in 'Email Address', with: 'abacon@test.com'
    fill_in 'Password', with: 'pass1'
    click_on 'Log in'

    expect(page).to have_content 'Book a Space'
    expect(page).to have_current_path '/spaces'
  end
end
