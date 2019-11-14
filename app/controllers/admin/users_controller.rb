class Admin::UsersController < Admin::ApplicationController
  def show
  	@user = User.find(params[:id])
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def index
    @users = User.all
    @user = User.find_by(params[:id])
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
