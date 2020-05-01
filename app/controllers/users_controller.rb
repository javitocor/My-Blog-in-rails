class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    #@user = User.find_by_username(params[:id])
    #@user = User.find(params[:id])
    @user = current_user
  end
end
