class Admin::UsersController < Admin::ApplicationController
   before_action :authenticate_admin!
  def show
  	@user = User.find(params[:id])
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def index
    @user = User.find_by(params[:id])
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :icon, :email, :self_introduction)
  end

end
