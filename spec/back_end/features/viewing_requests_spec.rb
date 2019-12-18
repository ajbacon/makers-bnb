feature 'viewing requests' do
  scenario 'a user wants to view their requests' do
    sign_up
    sign_in
    list_test_space
    click_on 'Requests'

    expect(page).to have_current_path '/requests'
    expect(page).to have_content "Requests I've made"
    expect(page).to have_content "Requests I've received"
  end
end