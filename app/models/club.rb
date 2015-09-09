class Club < ActiveRecord::Base
  belongs_to :pack

  has_many :pilots,  dependent: :destroy
  has_many :gliders, dependent: :destroy

  validates :short_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates_associated :pack
end
