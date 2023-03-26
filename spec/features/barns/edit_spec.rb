 # User Story 12, Barn Update 
# As a visitor
# When I visit a barn show page
# Then I see a link to update the barn "Update Barn"
# When I click the link "Update Barn"
# Then I am taken to '/barns/:id/edit' where I  see a form to edit the barn's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/barns/:id',
# the barn's info is updated,
# and I am redirected to the Barn's Show page where I see the barn's updated info

require 'rails_helper'
RSpec.describe '/barns/:id/edit' do
  describe 'links to an edit page from barn index and redirects to form' do 
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true) }

    let!(:horse_1) { barn_1.horses.create!(name: 'Clementine', breed: 'Tennessee Walker', age: 15, trail_user: true, arena_user: false, paid: true) }
    let!(:horse_2) { barn_1.horses.create!(name: 'Lefty', breed: 'Appedix Quarter Horse', age: 9, trail_user: true, arena_user: true, paid: true)}

    it 'links to an edit page and I can edit barns attributes' do
      visit "barns/#{barn_2.id}"

      click_on "Update Barn #{barn_2.id}"
      expect(current_path).to eq("/barns/#{barn_2.id}")

    end
  end
end