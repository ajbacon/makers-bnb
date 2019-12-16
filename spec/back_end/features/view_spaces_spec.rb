feature 'viewing listed spaces' do
    scenario 'a user can see all listed spaces' do
      visit '/' 
      click_on 'View Listings'
      expect(page).to have_current_path '/spaces'
      expect(page).to have_content 'Current spaces listing'
      expect(page).to have_content '1 Bedroom loft Peckham'
      expect(page).to have_content '50 Commercial street'
    end  
end