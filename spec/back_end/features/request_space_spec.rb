feature 'requesting a space' do
  scenario 'a user requests a space' do
    sign_up
    sign_in

    list_test_space

    click_on "space-#{test_space.id}"
    expect(page).to have_content test_space.description
    fill_in 'requested-date', with: '12122020'
    click_on 'Request to Book'

    expect(page).to have_current_path '/requests'
    expect(page).to have_content test_space.name
  end
end