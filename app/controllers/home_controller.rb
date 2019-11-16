class HomeController < ApplicationController

  def index
    # if a params[:search] is received
    if params[:search]
      # call the model method search_vet_profiles, defined in VetProfile model
      @search_results_vet_profiles = VetProfile.search_vet_profiles(params[:search])
      # send the search results to the partial view _search-results.js.erb
      # located at views/user_profiles
      respond_to do |format|
        format.js { render partial: 'layouts/search-results'}
      end
    else
      @vet_profiles = VetProfile.all
    end
  end

  def show
    @vet_profile = VetProfile.find(params[:id])
  end
end
