feature 'decline received requests' do
  scenario 'a user can decline received requests' do
    sign_up
    list_test_space
    click_on 'Sign out'

    sign_up_user_2
    click_on 'BIG HOUSE'
    fill_in 'requested-date', with: '12/04/2019'
    click_on 'Request to Book'
    # log out (nav bar functionality to implement)

    sign_in
    click_on 'Requests'
    click_on 'BIG HOUSE'
    
    expect(page).to have_content 'From: tuna@test.com'
    expect(page).to have_content 'Date: 12/04/2019'

    click_on 'Decline request from: tuna@test.com'

    expect(page).to have_current_path '/requests'
    expect(page).to have_content 'Declined'
  end 
end
