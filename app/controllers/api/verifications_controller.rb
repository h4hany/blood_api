class Api::VerificationsController < ApiController
  before_action :set_confirmation_code, only: [:confirm]


  def get_code
    user_id = @current_user.id
    @donor_profile = DonorProfile.find_by(user_id: user_id)
  end

  def confirm
    user_id = @current_user.id
    donor = DonorProfile.find_by(user_id: user_id)
    if donor && donor.verification_code == set_confirmation_code
      donor.is_avaliable = 1
      donor.is_verified = 1
      if donor.save
        render json: {msg: 'user has been confirmed'}, status: :ok
      else
        render json: {errors: donor.errors}, status: :unprocessable_entity
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donor_profile
    @donor_profile = DonorProfile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def set_confirmation_code
    params.require(:confirm).permit(:verification_code)
  end
end
