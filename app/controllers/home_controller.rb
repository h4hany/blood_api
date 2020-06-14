class HomeController < ApplicationController

  def register

    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      if @user.type.donor?
        donor =  DonorProfile.new(donor_params)
        donor.user = @user
        if donor.save
          render json: {user: @user,msg: "confirm msg has been sent", token: token}
        end
      end
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :password, :mobile,:type)
  end
  def donor_params
    params.require(:donor).permit(:latitude, :longitude, :blood_type_id)
  end
end