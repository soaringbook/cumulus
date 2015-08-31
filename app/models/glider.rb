class Glider < ActiveRecord::Base
  belongs_to :club

  validates :immatriculation, presence: true, uniqueness: true
  validates :name,            presence: true
  validates :club,            presence: true
end
