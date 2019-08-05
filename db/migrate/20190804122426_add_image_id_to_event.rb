class AddImageIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :image_id, :integer
    add_index :events, :image_id
  end
end
