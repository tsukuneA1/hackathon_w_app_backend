class RemoveEmailFromUsers < ActiveRecord::Migration[8.0]
  def change
    if column_exists?(:users, :email)
      remove_column :users, :email, :string
    end
  end
end

class AddProfileAndSkillsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :bio, :text unless column_exists?(:users, :bio)
    add_column :users, :location, :string unless column_exists?(:users, :location)
    # skills は将来のマッチング用に jsonb（PostgreSQL）を想定。存在しないときだけ追加
    add_column :users, :skills, :jsonb, null: false, default: [] unless column_exists?(:users, :skills)
    add_index :users, :skills, using: :gin unless index_exists?(:users, :skills)
  end
end