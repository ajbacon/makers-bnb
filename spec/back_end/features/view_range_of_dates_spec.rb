feature 'viewing available dates' do
  scenario 'a user can select an available date' do
    sign_up

    list_test_space
    sign_up_user_2
    click_on 'BIG HOUSE'
    find('#requested-date').click

    tomorrow = first('.day') { |day| !day[:class].split.include? 'disabled' }
    tomorrow.click
    click_on 'Request to Book'

    date_of_tomorrow = (Time.now + one_day).strftime('%d/%m/%Y')
    
    expect(page).to have_content date_of_tomorrow
  end

  scenario 'a user cannot select a date before the available range' do
    sign_up

    list_test_space
    sign_up_user_2
    click_on 'BIG HOUSE'
    find('#requested-date').click

    a_day = 1
    tomorrow = first('.day') { |day| !day[:class].split.include? 'disabled' }
    day_of_tomorrow = tomorrow.text
    today = first('.day') { |day| day.text == (day_of_tomorrow.to_i - a_day).to_s }
    today.click
    click_on 'Request to Book'

    expect(find('#requested-date').value).to eq ''
    expect(page).to have_current_path "/spaces/#{test_space.id}"
  end

  scenario 'a user cannot select a date after the available range' do
    sign_up

    list_test_space
    sign_up_user_2
    click_on 'BIG HOUSE'
    find('#requested-date').click

    a_week = 7
    tomorrow = first('.day') { |day| !day[:class].split.include? 'disabled' }
    day_of_tomorrow = tomorrow.text
    a_week_tomorrow = first('.day') { |day| day.text == (day_of_tomorrow.to_i + a_week).to_s }
    a_week_tomorrow.click
    sleep 5
    click_on 'Request to Book'

    expect(find('#requested-date').value).to eq ''
    expect(page).to have_current_path "/spaces/#{test_space.id}"
  end
end
