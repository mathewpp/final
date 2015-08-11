class MessagesController < ApplicationController

  def new
    @message = DirectMessage.new
  end

  def create
    @message = DirectMessage.new
    @message.message = params[:message]
    @message.create_time = DateTime.now
    @message.sender_id = User.find_by(session[:user_id])
    @message.receiver_id = User.find_by(:user_name => params["receiver"])
    if @message.save
      flash[:notice] = "Message sent to #{params[:receiver]}"
      redirect_to root_url # "/"
    else
      @messages = DirectMessage.where(:receiver_id => session[:user_id])
      render 'index'
    end
  end

  def index
    @messages = DirectMessage.where(:receiver_id => session[:user_id])
  end

end
