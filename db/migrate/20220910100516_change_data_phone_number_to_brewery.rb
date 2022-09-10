class ChangeDataPhoneNumberToBrewery < ActiveRecord::Migration[6.1]
  def change
    change_column :breweries, :phone_number, :string
  end
end
