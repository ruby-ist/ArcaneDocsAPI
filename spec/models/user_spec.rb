require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.create! }

    it "has associated tables" do
        expect(user.posts).not_to be_nil
        expect(user.likes).not_to be_nil
        expect(user.shared_posts).not_to be_nil
        expect(user.received_posts).not_to be_nil
    end

    it "can be deleted along with its children" do
        another_user = User.create!
        post = Post.create!(user: user)
        like = Like.create!(user: user, post: post)
        share = Share.create!(from: user, to: another_user, post: post)

        expect(Post.all).not_to be_empty
        expect(Like.all).not_to be_empty
        expect(Share.all).not_to be_empty

        user.destroy

        expect(Post.all).to be_empty
        expect(Like.all).to be_empty
        expect(Share.all).to be_empty
    end
end