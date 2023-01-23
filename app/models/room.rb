class Room < ApplicationRecord

  has_many :room_messages, dependent: :destroy, inverse_of: :room
  has_many :accesses, dependent: :destroy

  validates :name, presence: true
  validates :name, length: {minimum: 3, maximum: 30} 
  
end
