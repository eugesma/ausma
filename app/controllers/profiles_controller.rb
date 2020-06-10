class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :edit, :update ] 

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      flash[:success] = "Tu perfil se ha modificado correctamente."
      redirect_to request.referrer
    else
      flash[:error] = "Tu perfil no se ha podido modificar."
      redirect_to request.referrer
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:id, :last_name, :first_name, :email, teacher_attributes: [ :id, :employee_num])
  end
end
