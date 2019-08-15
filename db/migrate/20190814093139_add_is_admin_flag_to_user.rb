class AddIsAdminFlagToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_flag, :boolean, null: false, default: false
  end
end
