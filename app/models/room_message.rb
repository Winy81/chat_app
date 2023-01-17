class RoomMessage < ApplicationRecord

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  validates :room_id, presence: true
  validates :message, presence: true
  validates :message, length: {minimum: 0, maximum: 10000}

  def self.messgage_filter(parameters)
  	all.where(parameters)
  end
  
end
