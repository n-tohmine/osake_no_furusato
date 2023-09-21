class AddIndexToBreweries < ActiveRecord::Migration[6.1]
  def change
    add_index :breweries, [:name, :address], unique: true
  end
end
