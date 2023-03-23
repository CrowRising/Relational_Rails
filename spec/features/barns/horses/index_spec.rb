require 'rails_helper'

RSpec.describe 'barns/:barn_id/horses', type: :feature do
  describe 'as a visitor when i visit the barns horses index page' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true)}

    let!(:horse_1) { barn_1.horses.create!(name: 'Clementine', breed: 'Tennessee Walker', age: 15, trail_user: true, arena_user: false, paid: true) }
    let!(:horse_2) { barn_1.horses.create!(name: 'Lefty', breed: 'Appedix Quarter Horse', age: 9, trail_user: true, arena_user: true, paid: true) }
  
     it 'displays each horse and attributes associated with barn_1' do
      visit "/barns/#{barn_1.id}/horses"

      expect(page).to have_content(horse_1.name)
      expect(page).to have_content(horse_1.breed)
      expect(page).to have_content(horse_1.age)
      expect(page).to have_content(horse_1.trail_user)
      expect(page).to have_content(horse_1.arena_user)
      expect(page).to have_content(horse_1.paid)
      expect(page).to have_content(horse_2.name)
      expect(page).to have_content(horse_2.breed)
      expect(page).to have_content(horse_2.age)
      expect(page).to have_content(horse_2.trail_user)
      expect(page).to have_content(horse_2.arena_user)
      expect(page).to have_content(horse_2.paid)
    end
  end
end