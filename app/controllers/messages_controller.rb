class MessagesController < ApplicationController

  before_action :authenticate_user! , :only => [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]


  def show
    @message = Message.find(params[:id])
  end

  def index
    @messages = Message.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(text: message_params[:text], location: message_params[:location], image: message_params[:image], user_id: current_user.id )
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.user_id == current_user.id
     @message.update(message_params)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @meaage.destroy if @message.user_id == current_user.id
  end

  private
  def message_params
    params.require(:message).permit(:text, :location, :image)
  end

  def move_to_index
    redirect_to action: :index  unless user_signed_in?
  end

end
