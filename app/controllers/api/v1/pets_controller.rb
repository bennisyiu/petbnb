class Api::V1::PetsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    @pets = Pet.all
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

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :gender, :neutered, :price, :description, :age, :photo, :user_id)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages },
      status: :unprocessable_entity
  end
end
