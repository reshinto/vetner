class VetProfilesController < ApplicationController
  before_action :set_vet_profile, only: [:show, :edit, :update, :destroy]

  # GET /vet_profiles
  # GET /vet_profiles.json
  def index
    @vet_profiles = VetProfile.all
  end

  # GET /vet_profiles/1
  # GET /vet_profiles/1.json
  def show
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
    respond_to do |format|
      if @vet_profile.update(vet_profile_params)
        format.html { redirect_to @vet_profile, notice: 'Vet profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @vet_profile }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vet_profile
      @vet_profile = VetProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vet_profile_params
      params.require(:vet_profile).permit(:clinic_name, :address, :postalcode, :phone, :hours, :services, :vet_id, :image)
    end
end
