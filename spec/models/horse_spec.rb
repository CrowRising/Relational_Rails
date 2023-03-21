require 'rails_helper'

RSpec.describe Horse, type: :model do
  describe 'relationships' do
    it { should belong_to :barn }
  end
end