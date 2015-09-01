class Glider < ActiveRecord::Base
  include Searchable

  belongs_to :club

  validates :immatriculation, presence: true, uniqueness: true
  validates :name,            presence: true
  validates :club,            presence: true

  default_scope { order('gliders.immatriculation') }

  def self.searchable_fields
    [:name, :immatriculation]
  end
end
