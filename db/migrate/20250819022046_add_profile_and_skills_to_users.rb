class AddProfileAndSkillsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username,  :string unless column_exists?(:users, :username)
    add_column :users, :avatar_url, :string unless column_exists?(:users, :avatar_url)

    add_column :users, :bio, :text unless column_exists?(:users, :bio)
    add_column :users, :location, :string unless column_exists?(:users, :location)

    add_column :users, :skills, :jsonb, null: false, default: [] unless column_exists?(:users, :skills)
    add_index  :users, :skills, using: :gin unless index_exists?(:users, :skills, using: :gin)

    add_column :users, :role, :integer, null: false, default: 0 unless column_exists?(:users, :role)
    add_index :users, :username, unique: true unless index_exists?(:users, :username, unique: true)
  end
end
