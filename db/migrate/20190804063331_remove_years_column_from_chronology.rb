class RemoveYearsColumnFromChronology < ActiveRecord::Migration[5.2]
  def change
    remove_column :chronologies, :min_year, :integer
    remove_column :chronologies, :max_year, :integer
  end
end
