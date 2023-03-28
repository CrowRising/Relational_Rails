require 'rails_helper'
# User Story 2 -Barn Show
# As a visitor
# When I visit '/barns:id'
RSpec.describe '/barns/:id', type: :feature do
  describe 'as a visitor when I visit a barn by the id' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    
    it 'displays barn_1 and attributes' do
      visit "/barns/#{barn_1.id}"
      # save_and_open_page
     
      expect(page).to have_content(barn_1.location)
      expect(page).to have_content(barn_1.name)
      expect(page).to have_content(barn_1.arena)
      expect(page).to have_content(barn_1.trail_access)
      expect(page).to have_content(barn_1.monthly_fee)
      expect(page).to have_content(barn_1.stalls)
      expect(page).to have_content(barn_1.vacancy)
    end

    it 'displays a barn_2 and attributes' do
      visit "/barns/#{barn_2.id}"
     
      expect(page).to have_content(barn_2.location)
      expect(page).to have_content(barn_2.name)
      expect(page).to have_content(barn_2.arena)
      expect(page).to have_content(barn_2.trail_access)
      expect(page).to have_content(barn_2.monthly_fee)
      expect(page).to have_content(barn_2.stalls)
      expect(page).to have_content(barn_2.vacancy)
    end
  end

  describe 'as a visitor when I visit the barns show page' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true) }

    let!(:horse_1) { barn_1.horses.create!(name: 'Clementine', breed: 'Tennessee Walker', age: 15, trail_user: true, arena_user: false, paid: true) }
    let!(:horse_2) { barn_1.horses.create!(name: 'Lefty', breed: 'Appedix Quarter Horse', age: 9, trail_user: true, arena_user: true, paid: true)}
    let!(:horse_3) { barn_2.horses.create!(name: 'Willow', breed: 'Fjord', age: 8, trail_user: true, arena_user: true, paid: true)}
    it 'displays a count of horses at barn' do
      visit "/barns/#{barn_1.id}"

      expect(page).to have_content("Number of Horses: #{barn_1.horses.size}")
    end

    #   User Story 19, Parent Delete
    it 'displays a link to remove barn' do
      visit "/barns/#{barn_3.id}"

      click_button "Remove #{barn_3.name}"

      expect(current_path).to eq("/barns")
      expect(page).to_not have_content(barn_3.name)
    end
  end
end