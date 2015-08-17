class UsersController < ApplicationController

  before_action :find_user, only: [:update, :edit, :destroy]

  def find_user
    @user = User.find(params["id"])
  end

  def update
    # user.user_name = params[:user_name]
    # user.password = params[:password]
    @user.name = params[:name]
    @user.email = params[:email]
    # user.photo_url = params[:photo_url]
    @user.save
    render 'show'   
  end

  def edit
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
      flash[:notice] = "Thank you for signing up, #{@user.name}!, Login to start your journey with Twitter!"
      redirect_to root_url # "/"
    else
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
    search_text = params[:name]
    puts 'inside find'
    if search_text
      puts 'search_text'
      @users = User.where("user_name or name like ?", "%#{search_text}%")
      @follows = Follow.where(:follower => session[:user_id])
      @follows.each do follow
        puts follow.followed.user_name
      end  
    end  
    render 'search_and_results.html'
  end

end