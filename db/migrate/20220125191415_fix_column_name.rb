class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :end_data, :end_date
  end
end
