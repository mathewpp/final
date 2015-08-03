class HomeController < ApplicationController

  def index
  	@tweet = Tweet.all
  end


end
