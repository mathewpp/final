class HomeController < ApplicationController

  def index
  	if session[:user_id]
  		@user = User.find_by(:id => session[:user_id])
      if !@user
        redirect_to '/logout'
      end  
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