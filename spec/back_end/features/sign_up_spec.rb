feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/'
    click_on 'Sign Up'
    expect(page.has_field? 'First Name').to be true
    expect(page.has_field? 'Surname').to be true
    expect(page.has_field? 'Email').to be true
    expect(page.has_field? 'Password').to be true
    expect(page.has_field? 'Confirm Password').to be true
    expect(page.has_button? 'Create Account').to be true
    expect(page).to have_current_path('/users/new')
  end

  scenario 'a user can sign in after signing up' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'first-name', with: 'Andrew'
    fill_in 'surname', with: 'Bacon'
    fill_in 'email', with: 'abacon@test.com'
    fill_in 'password', with: 'pass1'
    fill_in 'confirm-password', with: 'pass1'
    click_on 'Create Account'
    
    expect(page.has_field? 'email').to be true
    expect(page.has_field? 'password').to be true
    expect(page).to have_current_path('/')
  end

end
