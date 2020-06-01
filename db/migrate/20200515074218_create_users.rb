class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :first
      t.string :img
      t.text :introduction

      t.timestamps
    end
  end
end
