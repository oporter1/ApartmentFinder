class AddColumnToApartment < ActiveRecord::Migration
  def change
    add_reference :apartments, :person, index: true, foreign_key: true
  end
end
