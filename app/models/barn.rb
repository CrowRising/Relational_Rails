class Barn < ApplicationRecord
  has_many :horses

  def self.order_by_creation_date
    order(created_at: :desc).to_a
  end

  def count_of_horses
    horses.size
  end

  def sort_by_name(sort)
    if sort =="order_alpha"
      self.horses.order(name: :asc)
    else
      self.horses
    end
  end
end