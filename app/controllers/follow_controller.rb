class FollowController < ApplicationController

   def create
    @follow = Follow.new
    @follow.followed_id =params["id"]
    @follow.follower_id =session[:user_id]
    follow_user = User.find(params["id"])
    @search_text = params[:search_text]
    if @follow.save
      # flash[:notice] = "You are following #{follow_user.user_name}<br>"
      if @search_text
        @users = User.where("name like ?", "%#{@search_text}%")
      end  
      render 'users/search_and_results'
    else
      redirect_to root_url # "/"
    end
    # render 'users/search_and_results'
  end

  def destroy
    follow_user = User.find(params["id"])
    @search_text = params[:search_text]
    @follow = Follow.find_by_followed_id_and_follower_id(params[:id],session[:user_id])
    if @follow.delete
      # flash[:notice] = "You unfollowed #{follow_user.user_name}"
      if @search_text
        @users = User.where("name like ?", "%#{@search_text}%")
      end  
      render 'users/search_and_results'
    else
      redirect_to root_url # "/"
    end
  end

  def followers
     @follows = Follow.where(:followed => session[:user_id])
     @follows = @follows.page(params[:page]).per(4)
  end

  def following
     @follows = Follow.where(:follower => session[:user_id])
     @follows = @follows.page(params[:page]).per(4)
  end

end