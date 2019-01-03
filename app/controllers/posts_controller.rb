class PostsController < ApplicationController
    include ApplicationHelper
    before_action :signed_in, only:[:new,:create]
    def new 
        @post = Post.new
    end
    def create 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to action: "index"
        else
            flash.now[:danger] = "ERROR!"
            render 'new'
        end
    end
    def index 
        @posts = Post.all
    end
    private 
        def post_params
            params.require(:post).permit(:body,:title,:user_id)
        end
end
