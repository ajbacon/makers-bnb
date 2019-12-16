feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/'
    click_on 'Sign Up'
    expect(page.has_field? 'First Name').to be true
    expect(page.has_field? 'Surname').to be true
    expect(page.has_field? 'Email').to be true
    expect(page.has_field? 'Password').to be true
    expect(page.has_field? 'Confirm Password').to be true
  end
end
