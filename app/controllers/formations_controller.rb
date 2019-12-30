class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :edit, :update, :destroy, :delete, :assign_dedication]

  # GET /formations
  # GET /formations.json
  def index
    @filterrific = initialize_filterrific(
      Formation,
      params[:filterrific],
      persistence_id: false,
      default_filter_params: { sorted_by: 'name_at_asc' },
      available_filters: [
        :search_by_name,
        :sorted_by
      ],
    ) or return
    @formations = @filterrific.find.page(params[:page]).per_page(15)
  end

  # GET /formations/1
  # GET /formations/1.json
  def show
  end

  # GET /formations/new
  def new
    @formation = Formation.new
    @formation_types = FormationType.all
  end

  def assign_dedication
    @teachers = Teacher.all
    @teacher_formation_roles = TeacherFormationRole.all
  end

  # GET /formations/1/edit
  def edit
    @formation_types = FormationType.all
  end

  # POST /formations
  # POST /formations.json
  def create
    @formation = Formation.new(formation_params)

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
    @formation.destroy
    respond_to do |format|
      format.html { redirect_to formations_url, notice: 'La formación se ha enviado a la papelera correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation
      @formation = Formation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formation_params
      params.require(:formation).permit(:name, :formation_type_id, :observation, :hours, teacher_ids: [], 
        teacher_formations_attributes: [:id, :teacher_id, :teacher_formation_role_id]
      )
    end
end
