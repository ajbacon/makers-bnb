feature 'requesting a space' do
  scenario 'a user requests a space' do
    create_user
    sign_in

    list_test_space

    click_on "space-#{test_space.id}"
    expect(page).to have_content test_space.description
  end
end