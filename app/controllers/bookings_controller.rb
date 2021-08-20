class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @bookings = Booking.all
  end

  def new
    recipie = session[:show_recipie]
    @book = Booking.new(name: recipie["title"], pictures: recipie["image"], recipie_number: recipie["id"] )
    @book.save
    redirect_to bookings_path
  end

  def destroy
    @book = Booking.find(params[:id])
    @book.destroy
    redirect_to bookings_path
  end
end
