class Pilot < ActiveRecord::Base
  belongs_to :club

  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable
end
