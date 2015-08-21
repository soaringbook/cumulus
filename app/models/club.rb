class Club < ActiveRecord::Base
  has_many :pilots

  validates :short_name, presence: true, uniqueness: true, length: { minimum: 4 }
end
