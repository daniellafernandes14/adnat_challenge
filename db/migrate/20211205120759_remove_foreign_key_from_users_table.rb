class RemoveForeignKeyFromUsersTable < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :users, :organisations
  end
end
