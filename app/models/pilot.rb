class Pilot < ActiveRecord::Base
  include Searchable

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :avatar, AvatarUploader

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

  ### Locale

  def self.locales
    %w(en)
  end

  ### Search

  def self.searchable_fields
    %i(email first_name last_name)
  end

  def name
    [first_name, last_name].compact.join ' '
  end
end
