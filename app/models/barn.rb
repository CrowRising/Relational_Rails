class Barn < ApplicationRecord
  has_many :horses

  def self.order_by_creation_date
    order(:created_at)
  end

  def count_of_horses
    horses.size
  end
end