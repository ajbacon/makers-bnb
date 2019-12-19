feature 'list spaces' do
  scenario 'an authenticated user can list a space' do
    sign_up

    expect(page).to have_current_path '/spaces'
    
    list_test_space

    expect(page).to have_current_path '/spaces'
    expect(page).to have_content 'BIG HOUSE'
    expect(page).to have_content "it's big.."
  end  

  scenario 'a user cannot list a space if not signed in' do
    visit '/spaces'
    click_on 'List a Space'
    expect(page).to have_current_path '/'
    expect(page).to have_content 'Please log in or sign up to list a space'
  end

  scenario 'a user cannot list a space after signing in and out' do
    sign_up
    click_on 'Sign out'
    click_on 'View Listings'
    click_on 'List a Space'
    expect(page).to have_current_path '/'
    expect(page).to have_content 'Please log in or sign up to list a space'
  end
end
