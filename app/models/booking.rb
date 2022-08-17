class Booking < ApplicationRecord
  has_person_name
  belongs_to :booking_type
  has_rich_text :notes

  validates :start_at, :end_at, :booking_type_id, :name, :email, presence: true

  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
