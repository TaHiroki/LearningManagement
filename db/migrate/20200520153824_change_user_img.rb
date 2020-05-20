class ChangeUserImg < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :img, :string
    add_column :users, :delete_flag, :integer
  end
end
