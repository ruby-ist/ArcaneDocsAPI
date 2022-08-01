class Received::PostsController < ApplicationController
    def index
        @user = User.find params[:user_id]
        @shares = @user.received_posts
        @posts = []
        @shares.each do |post_id|
            @posts << Post.find(post_id)
        end
        render json: @posts, include: [:images, :user]
    end
end
