class UsersController < ApplicationController
  before_filter :authenticate_user!

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
end
