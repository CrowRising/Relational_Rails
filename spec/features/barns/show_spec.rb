require 'rails_helper'
# User Story 2 -Barn Show
# As a visitor
# When I visit '/barns:id'
RSpec.describe '/barns/:id', type: :feature do
  describe 'as a visitor when I visit a barn by the id' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true)}

    it 'displays a barn and attributes' do
      visit "/barns/#{barn_1.id}"
save_and_open_page

      expect(page).to have_content(barn_1.location)
      expect(page).to have_content(barn_1.name)
      expect(page).to have_content(barn_1.arena)
      expect(page).to have_content(barn_1.trail_access)
      expect(page).to have_content(barn_1.monthly_fee)
      expect(page).to have_content(barn_1.stalls)
      expect(page).to have_content(barn_1.vacancy)
      
    end
  end
end