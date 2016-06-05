class HeadcrabsController < ApplicationController
  before_action :set_headcrab, only: [:show, :edit, :update, :destroy]

  # GET /headcrabs
  # GET /headcrabs.json
  def index
    @headcrabs = Headcrab.all
  end

  # GET /headcrabs/1
  # GET /headcrabs/1.json
  def show
  end

  # GET /headcrabs/new
  def new
    @headcrab = Headcrab.new
  end

  # GET /headcrabs/1/edit
  def edit
  end

  # POST /headcrabs
  # POST /headcrabs.json
  def create
    @headcrab = Headcrab.new(headcrab_params)

    respond_to do |format|
      if @headcrab.save
        format.html { redirect_to @headcrab, notice: 'Headcrab was successfully created.' }
        format.json { render :show, status: :created, location: @headcrab }
      else
        format.html { render :new }
        format.json { render json: @headcrab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headcrabs/1
  # PATCH/PUT /headcrabs/1.json
  def update
    respond_to do |format|
      if @headcrab.update(headcrab_params)
        format.html { redirect_to @headcrab, notice: 'Headcrab was successfully updated.' }
        format.json { render :show, status: :ok, location: @headcrab }
      else
        format.html { render :edit }
        format.json { render json: @headcrab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headcrabs/1
  # DELETE /headcrabs/1.json
  def destroy
    @headcrab.destroy
    respond_to do |format|
      format.html { redirect_to headcrabs_url, notice: 'Headcrab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headcrab
      @headcrab = Headcrab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def headcrab_params
      params.require(:headcrab).permit(:name, :birthday, :price, :description, :pic_url)
    end
end
