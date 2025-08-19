class AddProfileAndSkillsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username,  :string unless column_exists?(:users, :username)
    add_column :users, :avatar_url, :string unless column_exists?(:users, :avatar_url)

    add_column :users, :bio, :text unless column_exists?(:users, :bio)
    add_column :users, :location, :string column_exists?(:users, :location)

    add_column :users, :skills, :jsonb, null: false, default: {} unless column_exists?(:users, :skills)
    add_column :users, :role, :integer, null: false, default: 0 unless column_exists?(:users, :role)

    add_column :users, :oauth_provider, :string unless column_exists?(:users, :oauth_provider)
    add_column :users, :oauth_uid, :string unless column_exists?(:users, :oauth_uid)
    add_column :users, :oauth_token, :string unless column_exists?(:users, :oauth_token)
    add_column :users, :last_login_at, :string unless column_exists?(:users, :last_login_at)

    add_index :users, :skills, using: :gin unless index_exists?(:users, :skills, using: :gin)
    add_index :users, [:oauth_provider, :oauth_uid], unique:true,
              name: "index_users_on_oauth_provider_and_uid" unless index_exists?(users, [:aouth_provider, :oauth_uid], name: "index_users_on_oauth_provider_and_uid")
    add_index :users, :username, unique:true unless index_exists?(:users, :username)
  end
end