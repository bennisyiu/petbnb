json.extract! @pet, :id, :name, :breed, :gender, :neutered, :price, :description, :age, :user_id
json.created_at @pet.created_at.strftime("%e %b %Y %H:%M:%S%p")
