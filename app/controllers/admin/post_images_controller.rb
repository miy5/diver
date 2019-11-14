class Admin::PostImagesController < Admin::ApplicationController
	 before_action :authenticate_user!
	def index
		@post_images = PostImage.page(params[:page]).reverse_order
	end

	def destroy
	    @post_image = PostImage.find(params[:id])
	    @post_image.destroy
	    # redirect_to admin_user_path(user.id)
        redirect_to admin_users_path
	end

	def show
	end

	private
    def post_image_params
        params.require(:post_image).permit(:image, :caption, :user_id)
    end


end
