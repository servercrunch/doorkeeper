class UpdateDoorkeeperTables < ActiveRecord::Migration
  def change
    add_column :oauth_applications, :resource_owner_id, :integer, :null => false
    add_index :oauth_applications, :resource_owner_id
  end
end
