class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    authorize! :index, @user, :message => "Not authorized as a administrator"
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
