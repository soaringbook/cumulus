class Pilot < ActiveRecord::Base
  include Searchable

  belongs_to :club

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :club,       presence: true
  validates :first_name, presence: true
  validates :last_name,  presence: true

  accepts_nested_attributes_for :club

  ### Access

  enum glider_access: [:gliders_not_accessible, :gliders_readable, :gliders_writable]

  ### Search

  def self.searchable_fields
    %i(email)
  end
end
