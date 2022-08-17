class Booking < ApplicationRecord
  has_person_name
  belongs_to :booking_type
  has_rich_text :notes

  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
