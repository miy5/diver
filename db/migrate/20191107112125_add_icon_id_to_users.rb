class AddIconIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :icon_id, :text
  end
end
