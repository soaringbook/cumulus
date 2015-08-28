class Glider < ActiveRecord::Base
  validates :immatriculation, presence: true, uniqueness: true
  validates :name,            presence: true
end
