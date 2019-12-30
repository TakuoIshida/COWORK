class WorkPlacesController < ApplicationController
    protect_from_forgery with: :exception
    before_action :set_current_user
    before_action :authenticate_user!
    #pagination
    PER = 5
  # GET /work_places
  # GET /work_places.json
  def index
    #作成された順に降順で表示
    if user_signed_in?
      # flash[:alert] = 'ログインしました'
      @work_places = WorkPlace.page(params[:page]).per(PER)
      # 検索オブジェクト
      @search = WorkPlace.ransack(params[:q])  
      
      # 検索結果
      @work_places = @search.result
      
    else
      redirect_to root_path
    end
  end
  
 
      # def find
      #   # 店舗が存在し、店舗名も取得できたら・・・
      #   if params[:work_place].present? && params[:work_place][:name]
      #     # 検索オブジェクト
      #   @search = WorkPlace.ransack(params[:work_place])  
      #   #検索内容を小文字にしてあいまい検索 select from `workplaces`.* from `workplaces` where (name LIKE 'OFFICE')
      #   @work_places = @search.where('LOWER(name) LIKE ?', "%#{params[:work_place][:name].downcase}%")
      #   elsif 
      #   @work_places = WorkPlace.all
      #   end
      # end


  # GET /work_places/1
  # GET /work_places/1.json
  # =>loginしていれば全てのユーザーが確認可能
  def show
    if user_signed_in?
      
      @work_place = WorkPlace.find(params[:id])
      @open_hour = @work_place.opentime.hour
      @open_min = @work_place.opentime.strftime("%M")
      @close_hour = @work_place.closetime.hour
      @close_min = @work_place.closetime.strftime("%M")
      
      @comment = Comment.new
      @comment.work_place_id = params[:comment_id]
      
    else
      redirect_to root_path
    end
  end

  # =>registerとadminが使用可能
  def new
    @work_place = WorkPlace.new
  end

  # =>registerは自分のcreateしたもののみ、adminが使用可能
  def edit
    @work_place = WorkPlace.find(params[:id])
  end

  # =>registerとadminが使用可能
  def create
    @work_place = WorkPlace.new(work_place_params)

    respond_to do |format|
      if @work_place.save
        format.html { redirect_to @work_place, notice: 'ご登録ありがとうございます！' }
        format.json { render :show, status: :created, location: @work_place }
      else
        format.html { render :new, notice: '登録に失敗しました'}
        format.json { render json: @work_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_places/1
  # PATCH/PUT /work_places/1.json
  # =>registerは自分のcreateしたもののみ、adminが使用可能
  def update
    @work_place = WorkPlace.find(params[:id])
    respond_to do |format|
      if @work_place.update(work_place_params)
        format.html { redirect_to @work_place, notice: '更新されました' }
        format.json { render :show, status: :ok, location: @work_place }
      else
        format.html { render :edit }
        format.json { render json: @work_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_places/1
  # DELETE /work_places/1.json
  # =>registerは自分のcreateしたもののみ、adminが使用可能
  def destroy
    @work_place = WorkPlace.find(params[:id])
    @work_place.destroy
    respond_to do |format|
      format.html { redirect_to work_places_path, notice: '削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_current_user
      @user = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_place_params
      params.require(:work_place).permit(:name, :region, :tel, :url, :address, :opentime, :closetime,:image,:user_id)
    end
    
    def search_params
      params.require(:q).permit
    end
end

