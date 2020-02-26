feature 'view received requests' do
  scenario 'a user can view received requests' do
    sign_up
    list_test_space
    click_on 'Sign out'

    sign_up_user_2
    click_on 'BIG HOUSE'

    find('#requested-date').click
    tomorrow = first('.day') { |day| !day[:class].split.include? 'disabled' }
    tomorrow.click
    click_on 'Request to Book'

    sign_in
    click_on 'Requests'

    click_on 'BIG HOUSE'
    click_on 'Confirm request from: tuna@test.com'

    sign_up_user_3
    click_on 'BIG HOUSE'
    
    a_day = 1
    find('#requested-date').click
    first_available_date = first('.day') { |day| !day[:class].split.include? 'disabled' }
    day_of_first_available_date = first_available_date.text
    tomorrow = first('.day') { |day| day.text == (day_of_first_available_date.to_i - a_day).to_s }
    tomorrow.click
    click_on 'Request to Book'

    
    expect(find('#requested-date').value).to eq ''
    expect(page).to have_current_path "/spaces/#{test_space.id}"
  end 
end
