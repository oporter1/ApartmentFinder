class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.string :contact

      t.timestamps null: false
    end
  end
end
