class MessagesController < ApplicationController

  def new
    @message = DirectMessage.new
  end

  def create
    @message = DirectMessage.new
    @message.message = params[:message]
    @message.create_time = DateTime.now
    @message.sender_id = session[:user_id]
    @message.receiver_id = User.find_by(:user_name => params["receiver_id"]).id
    if @message.save
      flash[:notice] = "Message sent to #{params["receiver_id"]}"
      redirect_to root_url # "/"
    else
      @messages = DirectMessage.where(:receiver_id => session[:user_id])
      render 'index'
    end
  end

  def index
    @messages = DirectMessage.where(:receiver_id => session[:user_id])
    @messages = @messages.page(params[:page]).per(6)
  end

end