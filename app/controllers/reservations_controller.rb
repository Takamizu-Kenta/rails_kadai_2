class ReservationsController < ApplicationController
  # before_action :authenticate_user!
  before_action except: :new

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @room = Room.find_by(id: params[:room_id])
    
  end

   def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:people, :start_date, :end_date, :total, :room_id))
    @room = Room.find_by(id: params[:room_id])

    if @reservation.invalid?
      redirect_to room_path(@reservation.room_id)
      flash[:alert] = "フォームを正しく入力してください。"
    end


   end

   def complete
    @reservation = current_user.reservations.create(params.require(:reservation).permit(:people, :start_date, :end_date, :total, :room_id))
   end

   def destroy
    @reservasion = Reservation.find_by(params[:id])
    @reservasion.destroy
    flash[:notice] = "ご予約を削除しました"
    redirect_to :reservations
   end

end
