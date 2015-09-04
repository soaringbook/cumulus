class Pilot < ActiveRecord::Base
  belongs_to :club

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :club, presence: true

  accepts_nested_attributes_for :club

  enum gliders_access: [:gliders_not_accessible, :gliders_readable, :gliders_writable]
end
