class AddUrlToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :url, :text
  end
end
