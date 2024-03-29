class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy delete assign_dedication]
  def index
    authorize Meeting
    @filterrific = initialize_filterrific(
      Meeting,
      params[:filterrific],
      persistence_id: :meeting_filter,
      select_options: {
        sorted_by: Meeting.options_for_sorted_by
      }
    ) or return
    @meetings = @filterrific.find.page(params[:page]).per_page(15)
  end

  def show
    authorize @meeting
  end

  def assign_dedication
    authorize @meeting
    @teachers = Teacher.select(:id, :profile_id)
    @assistance_statuses = AssistanceStatus.all
  end

  def new
    authorize Meeting
    @meeting = Meeting.new
    @teachers = Teacher.select(:id, :profile_id)
  end

  def edit
    authorize @meeting
    @teachers = Teacher.all
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    authorize @meeting

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'La reunión se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        @teachers = Teacher.all
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    authorize @meeting
    respond_to do |format|
      if @meeting.update!(meeting_params)
        format.html { redirect_to @meeting, notice: 'La reunión se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    authorize @meeting
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'La reunión de ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  # GET /meeting/1/delete
  def delete
  end

  def assign_meeting
    authorize Meeting
    @assistance_statuses = AssistanceStatus.all
    @teachers = Teacher.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:name, :observation, :credit, :unity, :since_date, teacher_ids: [],
      teacher_meetings_attributes: [ :id, :teacher_id, :quantity, :assistance_status_id ] 
    )
  end
end
