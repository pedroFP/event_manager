class UsersController < ApplicationController
  authorize_resource
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def update
    @users = User.find(params[:id])
  end
end
