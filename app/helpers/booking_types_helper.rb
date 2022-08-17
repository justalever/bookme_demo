module BookingTypesHelper
  def duration(type)
    if type.duration == 60
      "1 hr"
    else
      type.duration.to_formatted_s + " mins"
    end
  end
end
