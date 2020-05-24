class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :subject
      t.integer :user_id
      t.integer :count

      t.timestamps
    end
  end
end
