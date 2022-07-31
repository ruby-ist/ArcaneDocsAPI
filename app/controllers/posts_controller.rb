class PostsController < ApplicationController
    before_action :set_user
    before_action :set_post, only: %i[ show update destroy ]

    def index
        @posts = @user.posts
        render json: @posts
    end

    def show
        render json: @post
    end

    def create
        @post = Post.new(title: post_params[:title], user: @user )
        if @post.save
            post_params[:images].each do |url|
                @image = Image.new(image_url: url, post: @post)
                unless @image.save
                    render json: @image.errors, status: :unprocessable_entity
                    return
                end
            end
            render json: @post, include: :images, status: :created
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def update
        if @post.update(title: post_params[:title])
            render json: @post, include: :images
        else
            render json: @post.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
    end

    private
    def set_user
        @user = User.find(params[:user_id])
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.fetch("post", {}).permit(:title, :images => [])
    end
end
