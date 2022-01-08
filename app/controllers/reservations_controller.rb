class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

   def back
    @reservation = Reservation.new(@attr)
    render :new
   end

   def confirm
    @reservation = Reservation.new(@attr)
    # if @reservation.invalid?
    #   render :new
    # end
   end

   def complete
    Reservation.create!(@attr)
   end

   private

   def permit_params
     @attr = params.require('reservation').permit(:people, :start_date, :end_date)
   end

end
