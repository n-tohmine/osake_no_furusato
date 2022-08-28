class RenameImageColumnToBreweries < ActiveRecord::Migration[6.1]
  def change
    rename_column :breweries, :image, :photo_reference
  end
end
