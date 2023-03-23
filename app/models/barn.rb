class Barn < ApplicationRecord
  has_many :horses

  def self.order_by_creation_date
    barns = self.all
    barns.order(:created_at)
  end
end