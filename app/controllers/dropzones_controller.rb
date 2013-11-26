class DropzonesController < ApplicationController
  before_action :set_dropzone, only: [:show, :edit, :update, :destroy]

  # GET /dropzones
  # GET /dropzones.json
  def index
    @dropzones = Dropzone.all
  end

  # GET /dropzones/1
  # GET /dropzones/1.json
  def show
    @drop = Drop.new
  end

  # GET /dropzones/new
  def new
    @dropzone = Dropzone.new
  end

  # GET /dropzones/1/edit
  def edit
  end

  # POST /dropzones
  # POST /dropzones.json
  def create
    @dropzone = Dropzone.new(dropzone_params)

    respond_to do |format|
      if @dropzone.save
        format.html { redirect_to @dropzone, notice: 'Dropzone was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dropzone }
      else
        format.html { render action: 'new' }
        format.json { render json: @dropzone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dropzones/1
  # PATCH/PUT /dropzones/1.json
  def update
    respond_to do |format|
      if @dropzone.update(dropzone_params)
        format.html { redirect_to @dropzone, notice: 'Dropzone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dropzone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dropzones/1
  # DELETE /dropzones/1.json
  def destroy
    @dropzone.destroy
    respond_to do |format|
      format.html { redirect_to dropzones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dropzone
      @dropzone = Dropzone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dropzone_params
      params.require(:dropzone).permit(:name).merge(:user => current_user)
    end
end
