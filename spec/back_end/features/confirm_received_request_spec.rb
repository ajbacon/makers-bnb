feature 'confirm received requests' do
  scenario 'a user can confirm a received request' do
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

    click_on 'Confirm request from: tuna@test.com'

    expect(page).to have_current_path '/requests'
    expect(page).to have_content 'confirmed'
  end

  scenario 'a user cannot re-confirm an already received request' do
    sign_up
    list_test_space
    click_on 'Sign out'

    sign_up_user_2
    request_space
    # log out (nav bar functionality to implement)

    sign_in
    click_on 'Requests'
    click_on 'BIG HOUSE'
    click_on 'Confirm request from: tuna@test.com'
    click_on 'BIG HOUSE'

    expect(page).to have_content 'Booking confirmed'
    expect(page).not_to have_selector(:link_or_button, 'Confirm request from: tuna@test.com')
    expect(page).not_to have_selector(:link_or_button, 'Decline request from: tuna@test.com')
  end

  scenario 'after a user confirms a requests, all the others with same date should be set as declined' do
    sign_up
    list_test_space
    click_on 'Sign out'

    sign_up_user_2
    request_space
    # log out (nav bar functionality to implement)

    sign_up_user_3
    request_space
    # log out (nav bar functionality to implement)

    sign_in
    click_on 'Requests'
    first('.request').click_button 'BIG HOUSE'
    click_on 'Confirm request from: tuna@test.com'
    # log out (nav bar functionality to implement)

    sign_in_user_3
    click_on 'Requests'

    expect(page).to have_content 'BIG HOUSE'
    expect(page).to have_content '12122020'
    expect(page).to have_content 'declined'
  end
end
