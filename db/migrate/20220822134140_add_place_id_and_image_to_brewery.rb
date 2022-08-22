class AddPlaceIdAndImageToBrewery < ActiveRecord::Migration[6.1]
  def up
    add_column :breweries, :place_id, :string
    add_column :breweries, :image, :string
  end

  def down
    remove_column :breweries, :place_id, :string
    remove_column :breweries, :image, :string
  end
end
