class Access < ApplicationRecord

  module LimitOfUsedRooms
    LIMIT_OF_ROOM_TO_USE = 100
  end

  belongs_to :user
  belongs_to :room

  validates :user_id, presence: true
  validates :room_id, presence: true

  def self.under_created_room_limit_by_user?(current_user)
    where(user_id:current_user.id).count <= Access::LimitOfUsedRooms::LIMIT_OF_ROOM_TO_USE
  end

end