class FollowController < ApplicationController

   def create
    @follow = Follow.new
    @follow.followed=params["id"]
    @follow.follower=session[:user_id]
    follow_user = User.find(params["id"])
    if @follow.save
      flash[:notice] = "You are following #{follow_user.user_name}"
    end
    redirect_to root_url # "/"

  end

  def destroy
    follow_user = User.find(params["id"])
    @follow = Follow.find_by_followed_and_follower(params[:id],session[:user_id])
    if @follow.delete
      flash[:notice] = "You unfollowed #{follow_user.user_name}"
    else
      redirect_to root_url # "/"
    end
  end


  def followers
     @follows = Follow.where(:followed => session[:user_id])
  end


  def following
     @follows = Follow.where(:follower => session[:user_id])
  end

end
