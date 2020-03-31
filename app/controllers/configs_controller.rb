class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to @config, notice: 'La dedicación se ha modificado correctamente.' }
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
      params.require(:config).permit(:assignature_preparation_percentage, :assignature_consultation_percentage)
    end
end
