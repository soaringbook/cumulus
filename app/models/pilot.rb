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
    :validatable,
    :confirmable

  validates :club,       presence: true
  validates :first_name, presence: true, on: :update
  validates :last_name,  presence: true, on: :update

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

  ### Devise

  def attempt_set_params(params)
    p = {}
    p[:first_name] = params[:first_name]
    p[:last_name] = params[:last_name]
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    p[:confirmation_token] = nil
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end
end
