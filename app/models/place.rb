class Place < ApplicationRecord
  belongs_to :user 
  validates :name, :description, :address,  presence: true
  validates :name, length: { minimum: 3}
  validates :name, :description, :address, exclusion: { in: %w(www com @ # io),
    message: "%{value} is reserved."}
  

end
