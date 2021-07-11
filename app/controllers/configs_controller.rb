class ConfigsController < ApplicationController
  before_action :set_config, only: %i[show edit update]

  def show
    authorize @config
  end

  def edit
    authorize @config
    @config.working_day_per_years.build
  end

  def update
    authorize @config
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to @config, notice: 'La configuración se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_config
    @config = Config.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def config_params
    params.require(:config).permit(:assignature_preparation_percentage, :assignature_consultation_percentage,
                                    working_day_per_years_attributes: [:id, :year, :number_of_days, :_destroy])
  end
end
