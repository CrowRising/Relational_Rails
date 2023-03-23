require 'rails_helper'
# User Story 1 -Barn Index
RSpec.describe '/barns', type: :feature do
  describe 'as a visitor I visit the barns index page' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true)}

    it 'displays all the names of all the barns' do
      visit '/barns'

      expect(page).to have_content(barn_1.name)
      expect(page).to have_content(barn_2.name)
      expect(page).to have_content(barn_3.name)
    end
 # User Story 6 -Barn Index sorted
    it 'displays all records of barn in order that they were created and the dates' do
      visit '/barns'
    
      expect(barn_1.name).to appear_before(barn_2.name)
      expect(page).to have_content(barn_1.created_at)
    end
  end
end