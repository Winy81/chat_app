class AddMembersToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :members, :string
  end
end
