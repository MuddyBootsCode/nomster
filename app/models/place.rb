class Place < ApplicationRecord
  belongs_to :user 
  validates :name, :description, :address,  presence: true
  validates :name, length: { minimum: 3}
  validates :name, :description, :address, exclusion: { in: %w(www com @ # /\B#\w+/),
    message: "%{value} is reserved."}

  geocoded_by :address
  after_validation :geocode
  

end
