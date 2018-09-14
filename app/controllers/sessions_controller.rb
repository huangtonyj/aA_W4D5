class SessionsController < ApplicationController

  def new # login page
    render :new
  end

  def create # login
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid login creds"]
      render :new
    end
  end

  def destroy # logout
    logout!
    redirect_to new_session_url
  end

end
