class MonthPresencesController < ApplicationController
  before_action :set_month_presence, only: [:show, :edit, :update, :destroy, :delete]

  # GET /month_presences
  # GET /month_presences.json
  def index
    @filterrific = initialize_filterrific(
      MonthPresence,
      params[:filterrific],
      persistence_id: false,
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :search_by_name,
        :sorted_by
      ],
    ) or return
    @month_presences = @filterrific.find.page(params[:page]).per_page(15)
  end

  # GET /month_presences/1
  # GET /month_presences/1.json
  def show
  end

  # GET /month_presences/new
  def new
    @month_presence = MonthPresence.new
    Teacher.find_each do |teacher|
      @month_presence.teacher_month_presences.build(teacher: teacher, presence_time: teacher.total_dedication_hours)
    end
  end

  def assign_assistance
    @teachers = Teacher.all
  end

  # GET /month_presences/1/edit
  def edit_assignment
    @teachers = Teacher.all
    @month_presence_types = month_presenceType.all
  end

  # month_presence /month_presences
  # month_presence /month_presences.json
  def create
    @month_presence = MonthPresence.new(month_presence_params)
    @month_presence.created_by = current_user

    respond_to do |format|
      if @month_presence.save
        format.html { redirect_to @month_presence, notice: 'La planilla de asistencia se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @month_presence }
      else
        @teachers = Teacher.all
        format.html { render :new }
        format.json { render json: @month_presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /month_presences/1
  # PATCH/PUT /month_presences/1.json
  def update
    respond_to do |format|
      if @month_presence.update(month_presence_params)
        format.html { redirect_to @month_presence, notice: 'La planilla de asistencia se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @month_presence }
      else
        format.html { render :edit }
        format.json { render json: @month_presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /month_presences/1
  # DELETE /month_presences/1.json
  def destroy
    @month_presence.destroy
    respond_to do |format|
      format.html { redirect_to month_presences_url, notice: 'La planilla de asistencia se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month_presence
      @month_presence = MonthPresence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def month_presence_params
      params.require(:month_presence).permit(:month_date, teacher_ids: [], 
        teacher_month_presences_attributes: [:id, :teacher_id, :presence_time, :presence_percent])
    end
end
