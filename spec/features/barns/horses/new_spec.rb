require 'rails_helper' 

RSpec.describe '/barns/:barn_id/horses/new' do
  describe 'as a visitor when I visit the barns horse index page I see a link' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true)}

    let!(:horse_1) { barn_1.horses.create!(name: 'Clementine', breed: 'Tennessee Walker', age: 15, trail_user: true, arena_user: false, paid: true) }
    let!(:horse_2) { barn_1.horses.create!(name: 'Lefty', breed: 'Appedix Quarter Horse', age: 9, trail_user: true, arena_user: true, paid: true) }

    it 'has a link to a new form to add a horse to the barn' do
        visit "/barns/#{barn_1.id}/horses"

        click_link "Create Horse"
        expect(current_path).to eq("/barns/#{barn_1.id}/horses/new")

        fill_in 'name', with: 'Scout'
        fill_in 'age', with: 27
        fill_in 'breed', with: 'Shire'
        fill_in 'trail_user', with: true
        fill_in 'arena_user', with: true
        fill_in 'paid', with: false
        click_button 'Create Horse'

        expect(current_path).to eq("/barns/#{barn_1.id}/horses")
        expect(page).to have_content('Scout')
        
    end
  end
end