class AddForeignKeyToUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :users, :organisations
  end
end
