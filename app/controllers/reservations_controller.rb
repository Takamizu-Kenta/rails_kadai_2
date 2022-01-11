class ReservationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :permit_params, except: :new

  def new
    @reservation = Reservation.new
  end

   def back
    @reservation = Reservation.new(@attr)
    render :new
   end

   def confirm
    @reservation = Reservation.new(@attr)
    @room = Room.find(params[:id])
    # if @reservation.invalid?
    #   render :new
    # end
   end

   def complete
    Reservation.create!(@attr)
   end

   private

   def permit_params
     @attr = params.require('reservation').permit(:people, :start_date, :end_date, :price) 
   end

  #  def heya
  #   start_date = @reservasion.start_date
  #   end_date = @reservasion.end_date
  #   days = (end_date - start_date).to_i + 1
  #   @reservasion.price = rooms.price
  #   @reservasion.total = rooms.price * days
  #  end

end
