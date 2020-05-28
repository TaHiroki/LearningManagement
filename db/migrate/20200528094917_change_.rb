class Change < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :flag, :integer
  end
end
