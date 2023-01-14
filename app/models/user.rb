class User < ApplicationRecord

  module Role
    ADMIN = 'admin'.freeze
    USER = 'user'.freeze
    GUEST = 'guest'.freeze
    ALL = [ADMIN, USER, GUEST]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true
  validates_presence_of :role
  validates_inclusion_of :role, in: Role::ALL

end
