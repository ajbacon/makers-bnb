feature 'requesting a space' do
  scenario 'a user requests a space' do
    sign_up
    list_test_space
    find('.space', match: :first).click

    expect(page).to have_content test_space.description
    
    fill_in 'requested-date', with: '12122020'
    click_on 'Request to Book'

    expect(page).to have_current_path '/requests'
    expect(page).to have_content 'BIG HOUSE'
    expect(page).to have_content 'Pending'
    expect(page).to have_content '12122020'
  end

  scenario 'a user is unable to create a request if not signed in' do
    sign_up
    list_test_space
    click_on 'Sign out'

    visit '/spaces'
    click_on 'BIG HOUSE'
    fill_in 'requested-date', with: '12122020'
    click_on 'Request to Book'

    expect(page).to have_current_path '/'
    expect(page).to have_content 'Please log in or sign up to request a space'
  end
end
