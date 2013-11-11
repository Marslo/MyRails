class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  # User controller with CanCan "load_and_authorize_resource"
  load_and_authorize_resource :only => :index
  # def index
    # authorize! :index, @user, :message => "Not authorized as a administrator"
    # @user = User.all
  # end

  # Users controller without cancan (Provided by Rolify gem)
  # before_filter :only_allow_admin, :only => [:index]
  # def index
    # @users = User.all
  # end
  # private
  # def only_allow_admin
    # redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_user.has_role? :admin
  # end

  def show
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => 'User updated.'
    else
      redirect_to user_path, :alert => 'Unable to update user.'
    end
  end

  def destory
    authorized! :destory, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destory
      redirect_to user_path, :notice => 'User deleted.'
    else
      redirect_to user_path, :notice => 'Cannot delete yourself.'
    end
  end
end
