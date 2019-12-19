feature 'viewing available dates' do
  scenario 'a user cannot select an unavailable date' do
    sign_up
    sign_in
    list_test_space
    sign_up_user_2
    sign_in_user_2
    # click on the first listed space
    find('.space', match: :first).click

    find('#requested-date').click

    valid_day = first('.day') { |day| !day[:class].split.include? 'disabled' }
    date = valid_day.text
    valid_day.click
    expect(find('#requested-date').value).to include date

    # find('#requested-date').click
    # invalid_day = first('.day') { |day| day[:class].split.include? 'disabled' }
    # invalid_day.click
    # expect(find('#requested-date').value).to eq valid_day.text
  end


  scenario 'a user cannot select an unavailable date' do
    sign_up
    sign_in
    list_test_space
    sign_up_user_2
    sign_in_user_2
    find('.space', match: :first).click

    find('#requested-date').click

    valid_day = first('.day') { |day| day[:class].split.include? 'disabled' }
    date = valid_day.text
    valid_day.click
    expect(find('#requested-date').value).to eq ''
  end
end