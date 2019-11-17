class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    redirect_to root_path
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    @pets = Pet.where(user_id: current_user.id)
    vet_ids = current_user.vets.map(&:id)
    user_profile = UserProfile.find(current_user.id)
    @userLat = user_profile.userLat
    @userLong = user_profile.userLong
    @vet_profiles = VetProfile.where(vet_id: vet_ids)
    @getAllVetProfilesDistance = VetProfile.all
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    require "open-uri"
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }

        result = JSON.load(open("https://developers.onemap.sg/commonapi/search?searchVal=#{@user_profile.postalcode}&returnGeom=Y&getAddrDetails=Y"))
        userLat = result["results"][0]["LATITUDE"]
        userLong = result["results"][0]["LONGITUDE"]
        address = result["results"][0]["ADDRESS"]
        @user_profile.update(:address => address, :userLat => userLat, :userLong => userLong)
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:first_name, :last_name, :address, :phone, :username, :image, :postalcode, :unit)
    end
end
