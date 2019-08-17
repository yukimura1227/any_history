class AddImageIdToChronology < ActiveRecord::Migration[5.2]
  def change
    add_column :chronologies, :image_id, :integer
    add_index :chronologies, :image_id
  end
end
