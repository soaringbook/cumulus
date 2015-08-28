class Club < ActiveRecord::Base
  has_many :pilots

  validates :short_name, presence: true, uniqueness: true, length: { minimum: 3 }
end
