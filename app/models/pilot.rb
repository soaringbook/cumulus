class Pilot < ActiveRecord::Base
  include Searchable

  belongs_to :club

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :club, presence: true

  accepts_nested_attributes_for :club

  ### Search

  def self.searchable_fields
    %i(email)
  end

  ### Access

  def self.access_rights
    [:gliders_not_accessible, :gliders_readable, :gliders_writable]
  end

  enum gliders_access: Pilot.access_rights
end
