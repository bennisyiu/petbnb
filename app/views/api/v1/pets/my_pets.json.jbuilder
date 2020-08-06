json.array! @pets do |pet|
  json.extract! pet, :id, :user_id, :name, :breed, :gender, :neutered, :price, :description, :age, :photo
  json.created_at pet.created_at.strftime("%e %b %Y %H:%M:%S%p")
end
