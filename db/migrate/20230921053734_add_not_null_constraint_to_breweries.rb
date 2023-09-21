class AddNotNullConstraintToBreweries < ActiveRecord::Migration[6.1]
  def up
    change_column :breweries, :name, :string, null: false
  end

  def down
    change_column :breweries, :name, :string, null: true
  end
end
