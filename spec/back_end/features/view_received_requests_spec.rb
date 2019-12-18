feature 'view received requests' do
  scenario 'a user can view received requests' do
    sign_up
    sign_in
    list_test_space
    'log out'

    sign_up_user_2
    sign_in_user_2
    click_on 'BIG HOUSE'
    fill_in 'requested-date', with:'12/04/2019'
    click_on 'Request to Book'
    'log out'
    sign_in
    click_on 'Requests'
    expect(page).to have_content 'BIG HOUSE'
    expect(page).to have_content '12/04/2019'
  end 
end 