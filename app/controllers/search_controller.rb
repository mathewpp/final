class SearchController < ApplicationController

  def users
    @users = User.all
  end
  
end
