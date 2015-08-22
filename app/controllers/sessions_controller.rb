class SessionsController < ApplicationController

  def new
  end

  def destroy
    # sessions[:user_id] = nil
    reset_session
    redirect_to root_url, notice: "See ya!"
  end
  
  def create
    user = User.find_by_user_name(params["user_name"])

    if user
      if user.authenticate(params["password"])
        session[:user_id] = user.id
        flash[:notice] = "Welcome Back, #{user.name}!"
        redirect_to root_url
      else
        flash[:notice] = "Verify and retry"
        render 'new'
      end
    else
      flash[:notice] = "Verify and retry"
      render 'new'
    end

  end
end
