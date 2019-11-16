class AddUserRefToUsersId < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_ids, :user_id, foreign_key: true
  end
end
