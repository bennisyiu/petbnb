class Api::V1::PetsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

 def index
  p 'in index action'
  if params[:query].present?
    @pets = search
  elsif params[:user_id].present?
    @user = User.find(params[:user_id])
    @pets = Pet.all.where.not(user: @user)
  else
    @pets = Pet.all
  end
end

def search
    sql_query = " \
      pets.name @@ :query \
      OR pets.breed @@ :query \
      OR pets.gender @@ :query \
      OR pets.description @@ :query \
    "
  Pet.where(sql_query, query: "%#{params[:query]}%")
end

  def my_pets
    @user = User.find(params[:user_id])
    @pets = @user.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    # debugger
    if @pet.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    render json: { status: :pet_deleted }
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :gender, :neutered, :price, :description, :age, :photo, :user_id)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages },
      status: :unprocessable_entity
  end
end
