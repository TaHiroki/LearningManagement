class ChangeNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :friends, :master , false
    change_column_null :friends, :user_id , false
    change_column_null :fites, :user_id , false
    change_column_null :fites, :comment_id , false
    change_column_null :replies, :reply , false
    change_column_null :replies, :comment_id , false
    change_column_null :subjects, :subject , false
    change_column_null :subjects, :user_id , false
    change_column_null :subjects, :count , false
    change_column_null :users, :name , false
    change_column_null :users, :email , false
    change_column_null :users, :password_digest , false
  end
end
