class ExtensionActivitiesController < ApplicationController
  before_action :set_extension_activity, only: [:show, :edit, :update, :destroy, :delete, :assign_dedication]
  def index
    @extension_activities = ExtensionActivity.all
  end

  def show
  end

  def assign_dedication
    @teachers = Teacher.all
  end

  def new
    @extension_activity = ExtensionActivity.new
    @teachers = Teacher.select(:id, :profile_id)
    @careers = Career.all
  end
  
  def edit
    @teachers = Teacher.all
    @careers = Career.all
  end

  # POST /extension_activities
  # POST /extension_activities.json
  def create
    @extension_activity = ExtensionActivity.new(extension_activity_params)

    respond_to do |format|
      if @extension_activity.save
        format.html { redirect_to @extension_activity, notice: 'La dedicación se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @extension_activity }
      else
        @teachers = Teacher.all
        @careers = Career.all
        format.html { render :new }
        format.json { render json: @extension_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extension_activities/1
  # PATCH/PUT /extension_activities/1.json
  def update
    respond_to do |format|
      if @extension_activity.update!(extension_activity_params)
        format.html { redirect_to @extension_activity, notice: 'La dedicación se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @extension_activity }
      else
        @careers = Career.all
        format.html { render :edit }
        format.json { render json: @extension_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extension_activities/1
  # DELETE /extension_activities/1.json
  def destroy
    @extension_activity.destroy
    respond_to do |format|
      format.html { redirect_to extension_activities_url, notice: 'La dedicación de ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  # GET /extension_activity/1/delete
  def delete
    respond_to do |format|
      format.js
    end
  end

  def assign_extension_activity
    @assistance_statuses = AssistanceStatus.all
    @teachers = Teacher.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_extension_activity
    @extension_activity = ExtensionActivity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def extension_activity_params
    params.require(:extension_activity).permit(:name, :observation, :credit, :duration, :unity, :code, :career_id, :min_credit,
      :min_preparation, :preparation, :min_implementation, :implementation, :evaluation, :min_evaluation, teacher_ids: [],
      teacher_extension_activities_attributes: [ :id, :teacher_id, :quantity, :assistance_status_id ] 
    )
  end
end
