class Api::DonorProfilesController < ApiController
  before_action :set_donor_profile, only: [:show, :update, :destroy]

  # GET /donor_profiles
  # GET /donor_profiles.json
  def index
    @donor_profiles = DonorProfile.all
  end

  # GET /donor_profiles/1
  # GET /donor_profiles/1.json
  def show
  end

  # POST /donor_profiles
  # POST /donor_profiles.json
  def create
    @donor_profile = DonorProfile.new(donor_profile_params)

    if @donor_profile.save
      render :show, status: :created
    else
      render json: @donor_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /donor_profiles/1
  # PATCH/PUT /donor_profiles/1.json
  def update
    if @donor_profile.update(donor_profile_params)

      if params.has_key?(:user)
        user =  @donor_profile.user
        if user.update(user_params)
          render :show, status: :ok

        end
      end
      render :show, status: :ok
    else
      render json: @donor_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /donor_profiles/1
  # DELETE /donor_profiles/1.json
  def destroy
    @donor_profile.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donor_profile
    @donor_profile = DonorProfile.find_by({user_id: params[:id]})
  end

  # Only allow a list of trusted parameters through.
  def donor_profile_params
    params.require(:donor_profile).permit(:user_id, :latitude, :longitude, :blood_type_id, :is_verified, :verification_code, :is_available)
  end

  def user_params
    params.require(:user).permit(:full_name, :password, :mobile, :type)
  end
end
