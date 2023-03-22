require 'rails_helper'
# User Story 2 -Barn Show
# As a visitor
# When I visit '/barns:id'
RSpec.describe '/barns/:id', type: :feature do
  describe 'as a visitor when I visit a barn by the id' do
    it 'displays a barn and attributes' do

      expect(page).to have_content(barn_1.location)
    end
  end
end