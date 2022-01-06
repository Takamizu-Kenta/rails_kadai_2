class RoomsController < ApplicationController
  before_action :set_search, only: [:index, :search]


  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :room_image))
    if @room.save
      flash[:notice] = "ルームをを新規登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
    @room = Room.find(params[:id])
    @room.update params.require(:room).permit(:name, :introduction, :price, :address, :room_image)
    redirect_to :rooms
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "お部屋を削除しました"
    redirect_to :rooms
  end

  def post
    @room = Room.reservasion
  end

  def search
    @results = @q.result
  end

  private
  before_action :set_search

  def set_search
    @q = Room.ransack(params[:q])
  end

end
