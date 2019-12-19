class RoomMessage < ApplicationRecord

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages
  validates :room_messages, presence: true
  validates :name, length: {minimum: 0, maximum: 3000} 

  def self.messgage_filter(parameters)
  	all.where(parameters)
  end
  
end
