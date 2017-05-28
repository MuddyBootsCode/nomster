class Place < ApplicationRecord
  
  belongs_to :user 
  has_many :comments, dependent: :destroy
  has_many :photo, dependent: :destroy


  validates :name, :description, :address,  presence: true
  validates :name, length: { minimum: 3}
  validates :name, :description, :address, format: { without: /[#@]/, message: "No email address or #'s' allowed." }
  

  geocoded_by :address
  after_validation :geocode
  
end
