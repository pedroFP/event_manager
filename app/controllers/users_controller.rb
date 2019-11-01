class UsersController < ApplicationController
  authorize_resource
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.role = params[:user][:role]
    if @user.save
      redirect_to users_path
    end
  end
end
