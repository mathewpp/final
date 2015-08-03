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
    user = User.find_by(:user_name => "test")
    tweet.user_id = user.id
    tweet.save
    redirect_to "/tweets"
  end

  def index
      @tweets = Tweet.all
  end

  def destroy
    tweet = Tweet.find_by(:id => params["id"])
    tweet.delete
    redirect_to "/tweets"
  end

  def show
    @tweet = Tweet.find_by(:id => params["id"])
  end

end
