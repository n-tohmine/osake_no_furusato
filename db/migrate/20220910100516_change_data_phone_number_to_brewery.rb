class ChangeDataPhoneNumberToBrewery < ActiveRecord::Migration[6.1]
  def up
    change_column :breweries, :phone_number, :string
  end
end
