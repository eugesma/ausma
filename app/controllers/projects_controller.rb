class ProjectsController < ApplicationController
   before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
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
  end

  # GET /projects/new
  def new
    @project = Post.new
    @teachers = Teacher.all
    @project_types = PostType.all
  end

  # GET /projects/1/edit
  def edit
    @teachers = Teacher.all
    @project_types = PostType.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Post.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        @teachers = Teacher.all
        @project_types = PostType.all
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :project_type_id, teacher_ids: [], teacher_projects_attributes: [:id, :teacher_id])
  end
end
