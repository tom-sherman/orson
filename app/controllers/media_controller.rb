# Media controller. Singular: `medium`
class MediaController < ApplicationController
  before_action :set_medium, only: %i[show edit update destroy]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
  end

  # GET /media/1
  # GET /media/1.json
  def show; end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit; end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(medium_params)

    respond_to do |format|
      if @medium.save
        format.html do
          redirect_to @medium, notice: 'Medium was successfully created.'
        end
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new }
        format.json do
          render json: @medium.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html do
          redirect_to @medium, notice: 'Medium was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json do
          render json: @medium.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html do
        redirect_to media_url, notice: 'Medium was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medium
    @medium = Medium.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def medium_params
    params.require(:medium).permit(:name)
  end
end
