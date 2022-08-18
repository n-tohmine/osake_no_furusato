class RemoveImageFromBreweries < ActiveRecord::Migration[6.1]
  def change
    remove_column :breweries, :image, :string
  end

  def down
    add_column :breweries, :image, :string
  end
end
