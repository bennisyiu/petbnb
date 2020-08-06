class AddTotalToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :total, :integer
  end
end
