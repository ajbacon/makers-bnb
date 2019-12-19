feature 'list spaces' do
  scenario 'an authenticated user can list a space' do
    sign_up
    sign_in

    expect(page).to have_current_path '/spaces'
    
    click_button 'List a Space'

    expect(page).to have_current_path '/spaces/new'

    fill_in 'name', with: 'A 5 bedroom mansion'
    fill_in 'description', with: 'Spacious house in a quiet location'
    fill_in 'price-per-night', with: '150'
    fill_in 'available-from', with: '12/01/19'
    fill_in 'available-to', with: '19/01/19'
    click_button 'List my Space'

    expect(page).to have_current_path '/spaces'
    expect(page).to have_content 'A 5 bedroom mansion'
    expect(page).to have_content 'Spacious house in a quiet location'
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
