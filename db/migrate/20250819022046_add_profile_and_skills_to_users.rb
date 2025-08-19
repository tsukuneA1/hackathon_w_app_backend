class AddProfileAndSkillsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :bio, :text unless column_exists?(:users, :location)
    add_column :users, :location, :string unless column_exists?(:users, :location)

    unless column_exists?(:users, :skills)
      add_column :users, :skills, :jsonb, null: false, default: {}
    end

    add_column :users, :role, :integer, null: false, default: 0 unless column_exists?(:users, :role)

    add_index :users, skills, usign: :gin unless index_exists?(:users, :skills, using: :gin)
  end
end
