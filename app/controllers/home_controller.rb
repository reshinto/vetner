class HomeController < ApplicationController
  def index
    if current_user
      @vet_profiles = VetProfile.all
      user_profile = UserProfile.find(current_user.id)
      @userLat = user_profile.userLat
      @userLong = user_profile.userLong
    end
  end
end
