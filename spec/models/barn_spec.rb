require 'rails_helper'

RSpec.describe Barn do
  describe 'relationships' do
    it { should have_many :horses }
  end
end