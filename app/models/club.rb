class Club < ActiveRecord::Base
  include Searchable

  extend FriendlyId
  friendly_id :short_name, use: :slugged

  has_many :pilots,  dependent: :destroy
  has_many :gliders, dependent: :destroy

  validates :short_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :active_until, date: true

  default_scope { order('clubs.short_name') }

  ### Search

  def self.searchable_fields
    %i(short_name)
  end
end
