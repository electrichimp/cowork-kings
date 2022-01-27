class AddCoordinatesToCoworkings < ActiveRecord::Migration[6.1]
  def change
    add_column :coworkings, :latitude, :float
    add_column :coworkings, :longitude, :float
  end
end
