class AddBasicColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :avatar, :string
    add_column :users, :living_place, :integer
    add_column :users, :favorite_liquor_type, :integer
    add_column :users, :self_introduction, :text
    add_column :users, :role, :integer, default: 0, null: false  
  add_index :users, :name, unique: true
  end
end

