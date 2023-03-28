class Horse < ApplicationRecord
  belongs_to :barn

  def self.paid
    Horse.where(paid: "true").to_a
  end
end