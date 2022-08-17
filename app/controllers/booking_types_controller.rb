class BookingTypesController < ApplicationController
  before_action :set_booking_type, only: %i[ show edit update destroy ]

  # GET /booking_types or /booking_types.json
  def index
    @booking_types = BookingType.all
  end

  # GET /booking_types/1 or /booking_types/1.json
  def show
  end

  # GET /booking_types/new
  def new
    @booking_type = BookingType.new
  end

  # GET /booking_types/1/edit
  def edit
  end

  # POST /booking_types or /booking_types.json
  def create
    @booking_type = BookingType.new(booking_type_params)

    respond_to do |format|
      if @booking_type.save
        format.html { redirect_to booking_type_url(@booking_type), notice: "Booking type was successfully created." }
        format.json { render :show, status: :created, location: @booking_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_types/1 or /booking_types/1.json
  def update
    respond_to do |format|
      if @booking_type.update(booking_type_params)
        format.html { redirect_to booking_type_url(@booking_type), notice: "Booking type was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_types/1 or /booking_types/1.json
  def destroy
    @booking_type.destroy

    respond_to do |format|
      format.html { redirect_to booking_types_url, notice: "Booking type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_type
      @booking_type = BookingType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_type_params
      params.require(:booking_type).permit(:name, :location, :description, :color, :duration, :payment_required, :price, :user_id)
    end
end
