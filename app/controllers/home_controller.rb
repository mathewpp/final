class HomeController < ApplicationController

  def index
  	if session[:user_id]
  		@user = User.find(session[:user_id])
  	end

  	if params["keyword"].present?
      	keyword = params["keyword"].strip
      	@tweets = Tweet.where("content LIKE ?", '%' + keyword + '%')
     else 	
  		@tweets = Tweet.all
  	 end	


       
  	 @tweets = @tweets.page(params[:page]).per(4)
  end 	 
end 