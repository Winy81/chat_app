class AddSecurityToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :security, :boolean, default: false
  end
end
