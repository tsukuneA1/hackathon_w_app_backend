class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false, default: "github"
      t.string :uid, null: false
      t.string :username, null: false
      t.string :name, null: true
      t.string :avatar_url, null: true
      t.datetime :last_login_at, null: true

      t.timestamps
    end
    add_index :users, [ :provider, :uid ], unique: true
    add_index :users, :username, unique: true
  end
end
