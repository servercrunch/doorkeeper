class CreateDoorkeeperTables < ActiveRecord::Migration
  def change
    create_table :oauth_applications do |t|
      t.string :name,               :null => false
      t.string :uid,                :null => false
      t.string :secret,             :null => false
      t.string :redirect_uri,       :null => false
      t.integer :resource_owner_id, :null => false
      t.timestamps
    end

    create_table :oauth_access_grants do |t|
      t.integer  :resource_owner_id, :null => false
      t.integer  :application_id,    :null => false
      t.string   :token,             :null => false
      t.integer  :expires_in,        :null => false
      t.string   :redirect_uri,      :null => false
      t.datetime :created_at,        :null => false
      t.datetime :revoked_at
      t.string   :scopes
    end

    create_table :oauth_access_tokens do |t|
      t.integer  :resource_owner_id, :null => false
      t.integer  :application_id,    :null => false
      t.string   :token,             :null => false
      t.string   :refresh_token
      t.integer  :expires_in
      t.datetime :revoked_at
      t.datetime :created_at,        :null => false
      t.string   :scopes
    end
  end
end
