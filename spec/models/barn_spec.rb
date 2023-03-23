require 'rails_helper'

RSpec.describe Barn do
  describe 'relationships' do
    it { should have_many :horses }
  end

  describe 'instance methods' do
    let!(:barn_1) { Barn.create!(name: 'Nix', location: 'Nix Lane', arena: true, trail_access: true, monthly_fee: 360, stalls: 24, vacancy: true) }
    let!(:barn_2) { Barn.create!(name: 'Arrowhead', location: 'West Alameda', arena: true, trail_access: false, monthly_fee: 475, stalls: 20, vacancy: false) }
    let!(:barn_3) { Barn.create!(name: 'Goosedowns', location: 'Airport Road', arena: true, trail_access: false, monthly_fee: 900, stalls: 40, vacancy: true)}

    it '::order_by_creation_date' do
       expect(Barn.order_by_creation_date).to eq([barn_1, barn_2, barn_3])
    end
  end
end