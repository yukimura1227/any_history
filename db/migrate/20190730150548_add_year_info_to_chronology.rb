class AddYearInfoToChronology < ActiveRecord::Migration[5.2]
  def change
    add_column :chronologies, :max_year, :integer, null: false, default: 2019
    add_column :chronologies, :min_year, :integer, null: false, default: 2019
  end
end
