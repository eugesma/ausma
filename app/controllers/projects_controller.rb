class ProjectsController < ApplicationController
   before_action :set_project, only: [:show, :edit, :update, :destroy, :delete, :assign_dedication]

  # GET /projects
  # GET /projects.json
  def index
    authorize Project
    @filterrific = initialize_filterrific(
      Project,
      params[:filterrific],
      persistence_id: false,
      default_filter_params: { sorted_by: 'name_at_asc' },
      available_filters: [
        :search_by_name,
        :sorted_by
      ],
    ) or return
    @projects = @filterrific.find.page(params[:page]).per_page(15)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    authorize @project
  end

  # GET /projects/new
  def new
    authorize Project
    @project = Project.new
    @teachers = Teacher.all
  end

  # GET /projects/1/edit
  def edit
    authorize @project
    @teachers = Teacher.all
  end

  def assign_dedication
    authorize @project
    @teachers = Teacher.all
    @project_roles = ProjectRole.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    authorize @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'El proyecto se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @project }
      else
        @teachers = Teacher.all
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize @project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'El proyecto se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @project }
      else
        @project_roles = ProjectRole.all
        @teachers = Teacher.all
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize @project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'El proyecto se ha enviado a la papelera.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:code, :name, :project_type_id, :observation, teacher_ids: [],
      teacher_projects_attributes: [:id, :teacher_id, :week_hours, :project_role_id, :_destroy])
  end
end
