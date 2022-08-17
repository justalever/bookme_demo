class UsersController < ApplicationController
  def show
    @user = User.find_by(booking_link: params[:booking_link])
  end
end
