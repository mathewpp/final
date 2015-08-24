class TweetsController < ApplicationController

  def update
  	tweet = Tweet.find_by(:id => params["id"])
    tweet.content = params[:tweet]
    tweet.save
    redirect_to "/tweets"
  end

  def edit
    @tweet = Tweet.find_by(:id => params["id"])
  end

  def new
    logger.debug tweet.count.to_s
  end

  def create
    tweet = Tweet.new
    tweet.content = params[:tweet]
    tweet.photo_url = params[:photo_url]
    tweet.create_time = DateTime.now
    tweet.user_id = session[:user_id]
    tweet.save
    redirect_to "/tweets"
  end

   def index
     @tweetUser = User.find_by(id: session[:user_id])
     @tweets = @tweetUser.tweets
     @tweets = @tweets.page(params[:page]).per(5)
   end

  def destroy
    tweet = Tweet.find_by(:id => params["id"])
    tweet.delete
    redirect_to "/tweets"
  end

  def show
    if params[:id]
      @tweetUser = User.find_by(id: params[:id])
    else   
      @tweetUser = User.find_by(id: session[:user_id])
    end  
    @tweets = @tweetUser.tweets
    @tweets = @tweets.page(params[:page]).per(5)
  end

  def reply
    @tweet = Tweet.find_by(:id => params["id"])
  end

  def post_reply
    reply = Reply.new
    reply.message = params[:message]
    reply.user_id = session[:user_id]
    reply.tweet_id = params[:id]
    reply.create_time = DateTime.now
    reply.save
    redirect_to root_url # "/"
  end
end