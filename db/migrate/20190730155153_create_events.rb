class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :chronology_id
      t.integer :year
      t.integer :month
      t.integer :category_id

      t.timestamps

      t.index :chronology_id
      t.index :category_id
    end
  end
end
