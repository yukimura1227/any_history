class CreateChronologies < ActiveRecord::Migration[5.2]
  def change
    create_table :chronologies do |t|
      t.string :title, null: false
      t.text :description
      t.integer :user_id, null: false
      t.string :token, uniq: true, null: false

      t.timestamps
      t.index :user_id
    end
  end
end
