# Libraries controller
class LibrariesController < ApplicationController
  before_action :set_library, only: %i[show edit update destroy]

  # GET /libraries
  # GET /libraries.json
  def index
    @libraries = Library.all
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show; end

  # GET /libraries/new
  def new
    @library = Library.new
  end

  # GET /libraries/1/edit
  def edit; end

  # POST /libraries
  # POST /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html do
          redirect_to @library, notice: 'Library was successfully created.'
        end
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new }
        format.json do
          render json: @library.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html do
          redirect_to @library, notice: 'Library was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit }
        format.json do
          render json: @library.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @library.destroy
    respond_to do |format|
      format.html do
        redirect_to libraries_url, notice: 'Library was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_library
    @library = Library.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def library_params
    params.require(:library).permit(:path, :name)
  end
end
