class VetsController < ApplicationController
  before_action :authenticate_vet!

  # GET /vets/1
  # GET /vets/1.json
  def show
    @vet = Vet.find(params[:id])
    @vet_profile = VetProfile.find(@vet.id)
    user_ids = current_vet.users.map(&:id)
    @user_profiles = UserProfile.where(user_id: user_ids)
    # @pets = Pet.where(user_id: user_ids)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def vet_params
      params.require(:vet).permit(:email, :password)
    end
end