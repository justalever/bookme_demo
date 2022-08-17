class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @booking_type = BookingType.find_by(name: params[:booking_type])
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking_type = BookingType.find(params[:booking][:booking_type_id])

    respond_to do |format|
      if @booking.save

        unless @booking_type.payment_required?
          @booking.approved!
        end

        format.html { redirect_to root_url, notice: "Booking was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to root_url, notice: "Booking was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def intent
    @booking_type = BookingType.find(params[:_json])
    amount = @booking_type.price * 100

    payment_intent = Stripe::PaymentIntent.create(
      amount: amount,
      currency: 'usd',
      automatic_payment_methods: {
        enabled: true
      },
      metadata: {
        user_id: @booking_type.user.id,
        booking_type_id: @booking_type.id
      }
    )

    respond_to do |format|
      format.json { render json: { clientSecret: payment_intent['client_secret'] } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:booking_type_id, :status, :name, :email, :start_at, :end_at, :notes)
    end
end
