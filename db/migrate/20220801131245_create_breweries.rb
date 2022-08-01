class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.string :prefecture
      t.integer :liquor_type
      t.string :website_url
      t.string :image
      t.string :video_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
