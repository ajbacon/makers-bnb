feature 'blocking reserved dates' do
  scenario 'a user cannot select reserved dates' do
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
    
    expect(page).to have_selector(:link_or_button, 'BIG HOUSE')
    expect(page).to have_content '12/04/2019'
  end 
end
