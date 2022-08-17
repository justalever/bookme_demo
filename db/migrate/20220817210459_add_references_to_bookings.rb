class AddReferencesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_type_id, :integer
  end
end
