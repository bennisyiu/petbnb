json.client_bookings do
  json.array! @client_bookings do |booking|
  json.extract! booking, :id, :pet_id, :user_id, :start_date, :end_date, :total
  json.pet_name booking.pet.name
  json.pet_photo booking.pet.photo
  json.created_at booking.created_at.strftime("%e %b %Y %H:%M:%S%p")
end
end

json.owner_bookings do

json.array! @owner_bookings do |booking|
  json.extract! booking, :id, :pet_id, :user_id, :start_date, :end_date, :total
  json.pet_name booking.pet.name
  json.pet_photo booking.pet.photo
  json.created_at booking.created_at.strftime("%e %b %Y %H:%M:%S%p")
end

end
