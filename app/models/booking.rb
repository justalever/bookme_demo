class Booking < ApplicationRecord
  has_person_name
  belongs_to :booking_type
  has_rich_text :notes
end
