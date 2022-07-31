class LikesController < ApplicationController
    before_action :set_post
    before_action :set_user, except: [:index]

    def index
        render json: @post.likes
    end

    def create
        @like = Like.new(user: @user, post: @post)
        if @like.save
            render json: @like, status: :created
        else
            render json: @like.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @like = Like.find params[:id]
        @like.destroy
    end

    private
    def set_user
        @user = User.find params[:user_id]
    end

    def set_post
        @post = Post.find params[:post_id]
    end
end
