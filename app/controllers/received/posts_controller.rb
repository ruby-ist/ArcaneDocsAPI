class Received::PostsController < ApplicationController
    def index
        @user = User.find params[:user_id]
        @shares = @user.received_posts
        @posts = []
        @shares.each do |share|
            @posts << Post.find(share.post_id)
        end
        render json: @posts, include: [:images, :user]
    end
end
