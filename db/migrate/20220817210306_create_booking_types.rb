class CreateBookingTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_types do |t|
      t.string :name
      t.string :location
      t.string :color, default: "#000000"
      t.integer :duration
      t.boolean :payment_required, default: false
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
