feature 'sign in' do
  scenario 'a user can sign in' do
    sign_up
    sign_in

    expect(page).to have_current_path '/'
    expect(page).to have_content 'Welcome, abacon@test.com'
  end

  scenario 'a user fails to sign in' do
    sign_up
    visit '/'
    fill_in 'email', with: 'abacon@test.com'
    fill_in 'password', with: 'notpass1'
    click_on 'Sign In'

    expect(page).to have_current_path '/'
    expect(page).not_to have_content 'Welcome, abacon@test.com'
  end
end
