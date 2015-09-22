class Glider < ActiveRecord::Base
  include Searchable
  include Importable

  extend FriendlyId
  friendly_id :immatriculation, use: :slugged

  mount_uploader :avatar, AvatarUploader

  belongs_to :club

  has_and_belongs_to_many :pilots

  validates :immatriculation, presence: true, uniqueness: true
  validates :name,            presence: true
  validates :club,            presence: true

  default_scope { order('gliders.immatriculation') }

  ### Search

  def self.searchable_fields
    %i(immatriculation name)
  end

  ### Import

  def self.importable_fields
    %w(immatriculation name self_launching double_seater)
  end
end
