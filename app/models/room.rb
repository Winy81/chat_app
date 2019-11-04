class Room < ApplicationRecord

  has_many :room_messages, dependent: :destroy, inverse_of: :room
  validates :name, presence: true
  validates :name, length: {minimum: 3, maximum: 30} 
  
end
