json.extract! @booking, :id, :pet_id, :user_id, :start_date, :end_date, :total
json.created_at @booking.created_at.strftime("%e %b %Y %H:%M:%S%p")
