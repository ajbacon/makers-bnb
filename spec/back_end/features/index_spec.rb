feature 'index' do
  scenario 'it shows a welcome message' do
    visit '/'
    
    expect(page).to have_content 'Feel at home, anywhere'
  end
end
