class VetProfilesController < ApplicationController
  before_action :set_vet_profile,
  only: [:show, :edit, :update, :destroy, :add_vet_to_user, :remove_vet_from_user]

  before_action :authenticate_vet!, only: [:edit, :update, :destroy]

  @@baseOnemapUrl = "https://www.onemap.sg/amm/amm.html?mapStyle=Default&zoomLevel=15"

  # GET /vet_profiles
  # GET /vet_profiles.json
  def index
    # if a params[:search] is received
    if params[:search]
      # call the model method search_by_clinic_name, defined in VetProfile model
      @search_results_vet_profiles = VetProfile.search_by_clinic_name(params[:search])
      # send the search results to the partial view _search-results.js.erb
      # located at views/user_profiles
      respond_to do |format|
        format.js { render partial: 'user_profiles/search-results'}
      end
    else
      # render the view for list of vet profiles
      @vet_profiles = VetProfile.all
      vetPositions = ""
      @vet_profiles.each do |vp|
        vetPositions += "&marker=latLng:#{vp.vetLat},#{vp.vetLong}!colour:lightblue"
      end
      if current_user
        user_profile = UserProfile.find(current_user.id)
        # address = "#{user_profile.address} #{user_profile.country}"
        # userResults = Geocoder.search(address).first.coordinates
        # puts userResults
        # userLat = userResults[0]
        # userLong = userResults[1]
        userPosition = "&marker=latLng:#{user_profile.userLat},#{user_profile.userLong}!colour:red"
        @address = "#{@@baseOnemapUrl}#{userPosition}#{vetPositions}"
      else
        @address = "#{@@baseOnemapUrl}#{vetPositions}"
        puts @address
      end
    end
  end

  # GET /vet_profiles/1
  # GET /vet_profiles/1.json
  def show
    @vet_profile = VetProfile.find(params[:id])
    vetPosition = "&marker=latLng:#{@vet_profile.vetLat},#{@vet_profile.vetLong}!colour:lightblue"
    if current_user
      user_profile = UserProfile.find(current_user.id)
      # address = "#{user_profile.address} #{user_profile.country}"
      # userResults = Geocoder.search(address).first.coordinates
      # userLat = userResults[0]
      # userLong = userResults[1]
      userPosition = "&marker=latLng:#{user_profile.userLat},#{user_profile.userLong}!colour:red"
      @address = "#{@@baseOnemapUrl}#{userPosition}#{vetPosition}"
    else
      @address = "#{@@baseOnemapUrl}#{vetPosition}"
    end
  end

  # GET /vet_profiles/new
  def new
    @vet_profile = VetProfile.new
  end

  # GET /vet_profiles/1/edit
  def edit
  end

  # POST /vet_profiles
  # POST /vet_profiles.json
  def create
    @vet_profile = VetProfile.new(vet_profile_params)
    @vet_profile.vet_id = current_vet.id

    respond_to do |format|
      if @vet_profile.save
        format.html { redirect_to @vet_profile, notice: 'Vet profile was successfully created.' }
        format.json { render :show, status: :created, location: @vet_profile }
      else
        format.html { render :new }
        format.json { render json: @vet_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vet_profiles/1
  # PATCH/PUT /vet_profiles/1.json
  def update
    require "open-uri"
    respond_to do |format|
      if @vet_profile.update(vet_profile_params)
        format.html { redirect_to @vet_profile, notice: 'Vet profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @vet_profile }

        result = JSON.load(open("https://developers.onemap.sg/commonapi/search?searchVal=#{@vet_profile.postalcode}&returnGeom=Y&getAddrDetails=Y"))
        vetLat = result["results"][0]["LATITUDE"]
        vetLong = result["results"][0]["LONGITUDE"]
        address = result["results"][0]["ADDRESS"]
        @vet_profile.update(:address => address, :vetLat => vetLat, :vetLong => vetLong)
      else
        format.html { render :edit }
        format.json { render json: @vet_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vet_profiles/1
  # DELETE /vet_profiles/1.json
  def destroy
    @vet_profile.destroy
    respond_to do |format|
      format.html { redirect_to vet_profiles_url, notice: 'Vet profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /vet_profiles/1/add_vet_to_user
  def add_vet_to_user
    # retrieve the vet object based on the vet_id passed from the form
    vet = Vet.find_by(id: add_vet_to_user_params[:vet_id])

    # check if the vet is already in the user's list of vets
    if current_user.vets and current_user.vets.map(&:id).include? vet.id
      redirect_to @vet_profile, notice: 'Vet was already added previously.'
    else
      # add this vet to the list of vets of the user
      current_user.vets << vet

      # redirect back to the vet profile page, with a notice
      respond_to do |format|
        # if the current user is successfully saved
        if current_user.save(validate: false)
          format.html { redirect_to @vet_profile, notice: 'Vet was successfully added to user.'}
        else
          format.html { redirect_to @vet_profile, notice: 'Error adding vet to user.'}
        end
      end
    end
  end

  # POST /vet_profiles/1/remove_vet_from_user
  def remove_vet_from_user
    # retrieve the vet object based on the vet_id passed from the form
    # this is the vet to be removed from the user's list of vets
    vet = Vet.find_by(id: remove_vet_from_user_params[:vet_id])

    # check if the user has vets AND
    # the vet to be removed is indeed in the user's list of vets
    if current_user.vets and current_user.vets.map(&:id).include? vet.id

      # delete the vet from the user's list of vets
      current_user.vets.delete(vet)

      redirect_to @vet_profile, notice: 'Vet has been removed.'

    else
      # if the vet to be removed is NOT in the user's list of vets
      # then there is nothing to be removed

      redirect_to @vet_profile, notice: 'Error removing vet.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vet_profile
      @vet_profile = VetProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vet_profile_params
      params.require(:vet_profile).permit(:clinic_name, :address, :unit, :postalcode, :phone, :hours, :services, :image, :website)
    end

    def add_vet_to_user_params
      params.require(:add_vet_to_user).permit(:vet_id)
    end

    def remove_vet_from_user_params
      params.require(:remove_vet_from_user).permit(:vet_id)
    end
end