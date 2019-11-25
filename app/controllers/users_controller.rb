class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
    redirect_to post_images_path
    else
    render 'edit'
    end
   end

  private
  def user_params
    params.require(:user).permit(:name, :icon, :email, :self_introduction)
  end

end
