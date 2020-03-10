class DedicationsController < ApplicationController
  before_action :set_dedication, only: [:show, :edit, :update, :destroy, :delete, :assign_dedication]
  def index
    @dedications = Dedication.all
  end

  def show
  end

  def assign_dedication
  end

  def new
    @dedication = Dedication.new
    @teachers = Teacher.select(:id, :profile_id)
  end
  
  def edit
    @teachers = Teacher.all
  end

  # POST /dedications
  # POST /dedications.json
  def create
    @dedication = Dedication.new(dedication_params)

    respond_to do |format|
      if @dedication.save
        format.html { redirect_to @dedication, notice: 'La dedicación se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @dedication }
      else
        @teachers = Teacher.all
        format.html { render :new }
        format.json { render json: @dedication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dedications/1
  # PATCH/PUT /dedications/1.json
  def update
    respond_to do |format|
      if @dedication.update!(dedication_params)
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
    @dedication.destroy
    respond_to do |format|
      format.html { redirect_to dedications_url, notice: 'La dedicación de ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  # GET /dedication/1/delete
  def delete
  end

  def assign_dedication
    @assistance_statuses = AssistanceStatus.all
    @teachers = Teacher.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dedication
    @dedication = Dedication.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dedication_params
    params.require(:dedication).permit(:name, :observation, :credit, :duration, :unity, teacher_ids: [],
      teacher_dedications_attributes: [ :id, :teacher_id, :quantity, :assistance_status_id ] 
    )
  end
end
