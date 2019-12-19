feature 'sign out' do
  scenario 'a user successfully signs out' do
    sign_up
    click_on 'Sign out'
    expect(page).to have_current_path '/'
    expect(page).to have_content 'You have signed out'
  end
end
