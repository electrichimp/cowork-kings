class CreateCoworkings < ActiveRecord::Migration[6.1]
  def change
    create_table :coworkings do |t|
      t.string :name
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.integer :capacity

      t.timestamps
    end
  end
end
