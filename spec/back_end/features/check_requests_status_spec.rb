feature 'checking the request status' do
  scenario "once a request is made a user can see the status 'Pending'" do
    sign_up
    sign_in
    list_test_space
    request_space
    expect(page).to have_current_path '/requests'
    expect(page).to have_content 'Pending'
  end
end
