class PetRecordsController < ApplicationController
  before_action :set_pet_record, only: [:show, :edit, :update, :destroy]

  # GET /pet_records
  # GET /pet_records.json
  def index
    @pet_records = PetRecord.all
  end

  # GET /pet_records/1
  # GET /pet_records/1.json
  def show
  end

  # GET /pet_records/new
  def new
    @pet_record = PetRecord.new
    @pets = Pet.where(user_id: current_user.id)
  end

  # GET /pet_records/1/edit
  def edit
    @pets = Pet.where(user_id: current_user.id)
  end

  # POST /pet_records
  # POST /pet_records.json
  def create
    @pet_record = PetRecord.new(pet_record_params)

    respond_to do |format|
      if @pet_record.save
        format.html { redirect_to @pet_record, notice: 'Pet record was successfully created.' }
        format.json { render :show, status: :created, location: @pet_record }
      else
        format.html { render :new }
        format.json { render json: @pet_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_records/1
  # PATCH/PUT /pet_records/1.json
  def update
    respond_to do |format|
      if @pet_record.update(pet_record_params)
        format.html { redirect_to @pet_record, notice: 'Pet record was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_record }
      else
        format.html { render :edit }
        format.json { render json: @pet_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_records/1
  # DELETE /pet_records/1.json
  def destroy
    @pet_record.destroy
    respond_to do |format|
      format.html { redirect_to pet_path(@pet), notice: 'Pet record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_record
      @pet_record = PetRecord.find(params[:id])
      @pet = @pet_record.pet
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_record_params
      params.require(:pet_record).permit(:title, :date, :content, :pet_id)
    end
end
