class Api::V1::BookingsController < Api::V1::BaseController

  skip_before_action :verify_authenticity_token

  def index
    @user = User.find(params[:user_id])
    @client_bookings = @user.bookings
    @owner_bookings = @user.bookings_as_owner
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    # debugger
    if @booking.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    render json: { status: :booking_deleted }
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :start_date, :end_date, :total)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },
      status: :unprocessable_entity
  end
end
