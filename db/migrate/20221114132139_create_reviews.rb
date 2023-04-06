class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :brewery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
