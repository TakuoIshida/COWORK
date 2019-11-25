class WorkPlacesController < ApplicationController
  before_action :set_work_place, only: [:show, :edit, :update, :destroy]

  # GET /work_places
  # GET /work_places.json
  def index
    @work_places = WorkPlace.all
  end

  # GET /work_places/1
  # GET /work_places/1.json
  def show
  end

  # GET /work_places/new
  def new
    @work_place = WorkPlace.new
  end

  # GET /work_places/1/edit
  def edit
  end

  # POST /work_places
  # POST /work_places.json
  def create
    @work_place = WorkPlace.new(work_place_params)

    respond_to do |format|
      if @work_place.save
        format.html { redirect_to @work_place, notice: 'Work place was successfully created.' }
        format.json { render :show, status: :created, location: @work_place }
      else
        format.html { render :new }
        format.json { render json: @work_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_places/1
  # PATCH/PUT /work_places/1.json
  def update
    respond_to do |format|
      if @work_place.update(work_place_params)
        format.html { redirect_to @work_place, notice: 'Work place was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_place }
      else
        format.html { render :edit }
        format.json { render json: @work_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_places/1
  # DELETE /work_places/1.json
  def destroy
    @work_place.destroy
    respond_to do |format|
      format.html { redirect_to work_places_url, notice: 'Work place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_place
      @work_place = WorkPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_place_params
      params.require(:work_place).permit(:name, :region, :tel, :url, :image, :user_id)
    end
end
