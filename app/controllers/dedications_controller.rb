class DedicationsController < ApplicationController
  before_action :set_dedication, only: [:show, :edit, :update, :destroy, :delete, :assign_dedication]
  
  # GET /dedications
  # GET /dedications.json
  def index
    authorize Dedication
    @dedications = Dedication.all
  end

  # GET /dedications/1
  # GET /dedications/1.json
  def show
    authorize @dedication
  end

  # GET /dedications/new
  def new
    authorize Dedication
    @dedication = Dedication.new
  end

  # GET /dedications/1/edit
  def edit
    authorize @dedication
  end

  def assign_dedication
    authorize @dedication
    @teachers = Teacher.all
  end

  # POST /dedications
  # POST /dedications.json
  def create
    @dedication = Dedication.new(dedication_params)
    authorize @dedication

    respond_to do |format|
      if @dedication.save
        format.html { redirect_to @dedication, notice: 'La dedicación se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @dedication }
      else
        format.html { render :new }
        format.json { render json: @dedication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dedications/1
  # PATCH/PUT /dedications/1.json
  def update
    authorize @dedication
    respond_to do |format|
      if @dedication.update(dedication_params)
        format.html { redirect_to @dedication, notice: 'La dedicación se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @dedication }
      else
        format.html { render :edit }
        format.json { render json: @dedication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dedications/1
  # DELETE /dedications/1.json
  def destroy
    authorize @dedication
    @dedication.destroy
    respond_to do |format|
      format.html { redirect_to dedications_url, notice: 'La dedicación se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dedication
      @dedication = Dedication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dedication_params
      params.require(:dedication).permit(:name, :hours, teacher_dedications_attributes: [:id, :teacher_id, :quantity])
    end
end
