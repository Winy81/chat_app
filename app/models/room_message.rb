class RoomMessage < ApplicationRecord

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  def self.messgage_filter(parameters)
  	all.where(parameters)
  end
  
end
