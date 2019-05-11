class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @messages = Message.where(user_id: current_user.id).page(params[:page]).per(5).order('created_at desc')
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(message_params)
    end
  end

  private
  def message_params
    params.require(:user).permit(:nickname, :self_introduction)
  end

end
