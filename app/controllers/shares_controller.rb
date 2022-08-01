class SharesController < ApplicationController
    before_action :set_user, :set_post

    def index
        @shares = Share.where(from: @user, post: @post)
        render json: @shares
    end

    def create
        @shares = []
        share_params[:users].each do |user_id|
            share = Share.find_or_initialize_by(from_id: @user.id, to_id: user_id, post: @post.id)
            if share.save
                @shares << share
            else
                render share.errors, status: :unprocessable_entity
                return
            end
        end
        render json: @shares, status: :created
    end

    def destroy
        @share = Share.find params[:id]
        @shares = Share.where(from_id: @share.to_id, post_id: @post)
        @share.destroy
        @shares.destroy_all
    end

    private
    def set_user
        @user = User.find params[:user_id]
    end

    def set_post
        @post = Post.find params[:post_id]
    end

    def share_params
        params.fetch('share', {}).permit(:users)
    end
end
