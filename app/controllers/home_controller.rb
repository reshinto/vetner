class HomeController < ApplicationController

  def index
    @vet_profiles = VetProfile.all
  end

  def show
    @vet_profile = VetProfile.find(params[:id])
  end
end
