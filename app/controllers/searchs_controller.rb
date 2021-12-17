class SearchsController < ApplicationController
  def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
  end

  class RoomsController < ApplicationController
    before_action :set_room, except: [:index, :new, :create]
    before_action :authenticate_user!, except: [:show]
    def index
       @rooms = current_user.rooms
    end
    def new
      @room = current_user.rooms.build
    end
    def create
      @room = current_user.rooms.build(room_params)
      if @room.save
        redirect_to listing_room_path(@room), notice: "保存しました。"
      else
        flash[:alert] = "問題が発生しました。"
        render :new
      end
    end
    def show
    end
    def listing
    end
    def pricing
    end
    def description
    end
    def photo_upload
    end
    def amenities
    end
    def location
    end
    def update
      new_params = room_params
      if @room.update(new_params)
        flash[:notice] = "保存しました。"
      else
        flash[:alert] = "問題が発生しました。"
      end
      redirect_back(fallback_location: request.referer)
    end

  end

  private
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        User.where(name: content)
      # 選択した検索方法がが部分一致だったら
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    # 選択したモデルがpostだったら
    elsif model == 'post'
      if method == 'perfect'
        Post.where(title: content)
      else
        Post.where('title LIKE ?', '%'+content+'%')
      end

      def set_room
        @room = Room.find(params[:id])
      end
      def room_params
        params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
      end
    end
  end
end
