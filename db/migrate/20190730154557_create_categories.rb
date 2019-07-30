class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :theme, null: false, default: ''
      t.integer :chronology_id, null: false, default: ''

      t.timestamps

      t.index :chronology_id
    end
  end
end
