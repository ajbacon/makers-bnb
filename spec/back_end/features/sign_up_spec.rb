feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in 'Email Address', with: 'abacon@test.com'
    fill_in 'Password', with: 'pass1'
    fill_in 'Password confirmation', with: 'pass1'
    click_on 'Sign up'

    expect(page).to have_current_path '/spaces'
  end
end
