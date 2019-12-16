feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/'
    click_on 'Sign Up'
    page.has_field? 'First Name'
    page.has_field? 'Surname'
    page.has_field? 'Email'
    page.has_field? 'Password'
    page.has_field? 'Confirm Password'
    page.has_button? 'Sign Up'
  end
end
