class AddBookingLinkToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :booking_link, :string
    add_index :users, :booking_link, unique: true
  end
end
