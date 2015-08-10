class SessionsController < ApplicationController

  def new
  end

  def destroy
    # sessions[:user_id] = nil
    reset_session
    redirect_to root_url, notice: "See ya!"
  end
  
  def create
    user = User.find_by_email(params["email"])

    if user
      if user.password == params["password"]
        cookies[:user_id] = user.id
        puts 'hello world!!!!!!!!'
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
