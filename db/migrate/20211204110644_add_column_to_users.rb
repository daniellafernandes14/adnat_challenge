class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :organisation_id, :integer
    add_reference :users, :organisation, foreign_key: true
  end
end
