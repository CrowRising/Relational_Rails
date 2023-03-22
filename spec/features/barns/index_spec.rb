require 'rails_helper'
# User Story 1 -Barn Index
# As a visitor
# When I visit '/barns'
# Then I see the name of all barn records in db
RSpec.describe '/barns', type: :feature do
  describe 'as a visitor I visit the barns index page' do
    it 'displays all the names of all the barns' do
      visit '/barns'

      expect(page).to have_content(barn_1.name)
      expect(page).to have_content(barn_2.name)
    end
  end
end