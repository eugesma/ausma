class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    authorize Evaluation
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    authorize @evaluation
  end

  # GET /evaluations/new
  def new
    authorize Evaluation
    @evaluation = Evaluation.new
    @user = current_user
    @meetings = Meeting.all
    @assignatures = Assignature.all
    @extension_activities = ExtensionActivity.all
    @teacher_formations = TeacherFormation.all
    @governments = Government.all
    @projects = Project.all
    @posts = Post.all
    @participations = Participation.all
  end

  # GET /evaluations/1/edit
  def edit
    authorize @evaluation
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    authorize @evaluation

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'La evaluación se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        @user = current_user
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    authorize @evaluation
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'La evaluación se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    authorize @evaluation
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'La evaluación se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:teacher_id, :user_id, :credit)
    end
end
