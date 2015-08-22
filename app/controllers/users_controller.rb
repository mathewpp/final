class UsersController < ApplicationController

  before_action :find_user, only: [:update, :edit, :destroy]

  def find_user
    @user = User.find(params["id"])
  end

  def update
    @user.name = params[:name]
    @user.email = params[:email]
    @user.save
    render 'show'   
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
    if params[:photo_url] && params[:photo_url]  =~ URI::regexp
      @user.photo_url = params[:photo_url]
    else   
      @user.photo_url = "avatar" + rand(1..4).to_s + ".jpeg"
      puts @user.photo_url
    end  
    if @user.save
      flash[:notice] = "Thank you for signing up, #{@user.name}!, Login to start your journey with Twitter!"
      redirect_to root_url # "/"
    else
      @user.photo_url = ''
      render 'new'
    end
  end

  def index
      @user = User.all
  end

  def destroy
    @user.delete
    redirect_to  "/logout"
  end

  def show
    @user = User.find(session[:user_id])
  end

  def find
    @search_text = params[:search_text]
    puts 'inside find'
    if @search_text
      @users = User.where("user_name or name like ?", "%#{@search_text}%")
    end  
    render 'search_and_results'
  end

end