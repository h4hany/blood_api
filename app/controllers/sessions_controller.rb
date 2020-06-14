class SessionsController < ApplicationController

  def login
    @user = User.find_by(mobile: params[:mobile])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      @user.token = token
      if @user.save
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end



end