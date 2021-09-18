class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :edit, :update, :destroy, :delete, :assign_dedication, 
    :confirm_validation, :validate]

  # GET /formations
  # GET /formations.json
  def index
    authorize Formation
    @filterrific = initialize_filterrific(
      Formation,
      params[:filterrific],
      persistence_id: :formations_filter,
      select_options: {
        sorted_by: Formation.options_for_sorted_by
      }
    ) or return
    @formations = @filterrific.find.page(params[:page]).per_page(15)
  end

  # GET /formations/1
  # GET /formations/1.json
  def show
    authorize @formation
  end

  # GET /formations/new
  def new
    authorize Formation
    @formation = Formation.new
    @formation_types = FormationType.all

    if policy(Formation).autoassign_formation?
      @formation.teacher_formations.build(teacher: current_user.teacher)
      @teacher_formation_roles = TeacherFormationRole.all
    end
  end

  def assign_dedication
    authorize Formation
    @teachers = Teacher.all
    @teacher_formation_roles = TeacherFormationRole.all
  end

  # GET /formations/1/edit
  def edit
    authorize @formation 
    @formation_types = FormationType.all
  end

  # POST /formations
  # POST /formations.json
  def create
    @formation = Formation.new(formation_params)
    @formation.created_by = current_user
    authorize @formation

    respond_to do |format|
      if @formation.save
        format.html { redirect_to @formation, notice: 'La formación se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @formation }
      else
        @formation_types = FormationType.all
        @teachers = Teacher.all
        format.html { render :new }
        format.json { render json: @formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formations/1
  # PATCH/PUT /formations/1.json
  def update
    authorize @formation
    respond_to do |format|
      if @formation.update(formation_params)
        format.html { redirect_to @formation, notice: 'La formación se ha editado correctamente.' }
        format.json { render :show, status: :ok, location: @formation }
      else
        @formation_types = FormationType.all
        format.html { render :edit }
        format.json { render json: @formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formations/1
  # DELETE /formations/1.json
  def destroy
    authorize @formation
    @formation.destroy
    respond_to do |format|
      format.html { redirect_to formations_url, notice: 'La formación se ha enviado a la papelera correctamente.' }
      format.json { head :no_content }
    end
  end

  def confirm_validation
    respond_to do |format|
      format.js
    end
  end

  def validate
    authorize @formation
    @formation.validated_by = current_user
    @formation.validado!
    flash[:notice] = "La formación se ha validado correctamente"
    respond_to do |format|
      format.html { redirect_to @formation, notice: 'La formación se ha validado correctamente' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation
      @formation = Formation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formation_params
      params.require(:formation).permit(:name, :formation_type_id, :observation, :hours, :init_date, :certificate, :link, teacher_ids: [],
        teacher_formations_attributes: [:id, :teacher_id, :teacher_formation_role_id, :_destroy]
      )
    end
end
