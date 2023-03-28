require 'rails_helper'
# User Story 3 -Horse Index
RSpec.describe '/horses', type: :feature do
  describe ' as a visitor when I visit horse index page' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true)}

    let!(:horse_1) { barn_1.horses.create!(name: 'Clementine', breed: 'Tennessee Walker', age: 15, trail_user: true, arena_user: false, paid: true) }
    let!(:horse_2) { barn_1.horses.create!(name: 'Lefty', breed: 'Appedix Quarter Horse', age: 9, trail_user: true, arena_user: true, paid: true)}
    
    it 'displays attributes of all horses' do
      visit '/horses'

      expect(page).to have_content("Name: #{ horse_1.name }")
      expect(page).to have_content("Breed: #{ horse_1.breed }")
      expect(page).to have_content("Age: #{ horse_1.age }")
      expect(page).to have_content("Trail_user: #{ horse_1.trail_user }")
      expect(page).to have_content("Arena_user: #{ horse_1.arena_user }")
      expect(page).to have_content("Paid: #{ horse_1.paid }")

      expect(page).to have_content("Name: #{ horse_2.name }")
      expect(page).to have_content("Breed: #{ horse_2.breed }")
      expect(page).to have_content("Age: #{ horse_2.age }")
      expect(page).to have_content("Trail_user: #{ horse_2.trail_user }")
      expect(page).to have_content("Arena_user: #{ horse_2.arena_user }")
      expect(page).to have_content("Paid: #{ horse_2.paid }")
  
    end
  end
  #User Story 15, Child Index only shows `true` Records 
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is 
  
end