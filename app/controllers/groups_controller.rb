class GroupsController < ApplicationController

  before_action :find_user, only: [:update, :edit, :destroy]

  def find_user
    @user = User.find(params["id"])
  end

  #TODO
  def update
  end

  #TODO
  def edit
  end

  #TODO
  def new
    @group = Group.new
  end

  #Create Group
  def create
    @group = Group.new
    @group.name = params[:name]
    @group.description = params[:description]
    if @group.save
      flash[:notice] = "Group, #{@group.name} is created succesfully!"
      redirect_to '/groups'
    else
      render 'new'
    end
  end

  #Join Group by user
  def join
      group = Group.find_by(:id => params[:id])
      @groupUser = GroupUser.new
      @groupUser.group_id = params[:id]
      @groupUser.user_id = session[:user_id]
      if @groupUser.save
        flash[:notice] = "You have joined #{group.name}!"
      end
      redirect_to '/groups'
  end  

  def index
      @groups = Group.all
      @groups = @groups.page(params[:page]).per(5)
      @user = User.find(session[:user_id])
  end

  ##For now, group deletes are not supported!! 
  #This method takes care of removing user from a group
  def remove_user_from_group
      group = Group.find_by(:id => params[:id])
      @groupUser = GroupUser.find_by_user_id_and_group_id(session[:user_id], params[:id])
      if @groupUser.delete
        flash[:notice] = "You are removed from #{group.name}!"
      end
      redirect_to '/groups'
  end

end