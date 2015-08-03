class UserController < ApplicationController


  def update
    user.user_name = params[:user_name]
    user.password = params[:password]
    user.name = params[:name]
    user.email = params[:email]
    user.photo_url = params[:photo_url]
    user.save
    redirect_to root_url
  end

  def edit
    @user = User.find_by(:id => params["id"])
  end

  def new
    @user = User.new
    logger.debug User.count.to_s
  end

  def create
    @user = User.new
    @user.user_name = params[:user_name]
    @user.password = params[:password]
    @user.name = params[:name]
    @user.email = params[:email]
    @user.photo_url = params[:photo_url]
    if @user.save
      redirect_to root_url # "/"
    else
      render 'new'
    end
  end

  def index
      @user = User.all
  end

  def destroy
    @user = User.find_by(:id => params["id"])
    @user.delete
    redirect_to root_url # "/"
  end

  def show
    @user = User.find_by(:id => params["id"])
  end

end
