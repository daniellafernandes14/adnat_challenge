class AddColumnsToUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_reference :users, :organisation, index: true
  end
end
