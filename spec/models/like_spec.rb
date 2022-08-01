require "rails_helper"

RSpec.describe Like, type: :model do
    let(:user) { User.create!(session_id: "some@gmail.com") }
    let(:post) { Post.create!(user: user, title: "Hello")}

    it "needs both user and post to save" do
        like = Like.new
        expect(like.save).to be_falsey
        like.post = post
        expect(like.save).to be_falsey
        like.user = user
        expect(like.user).not_to be_falsey
    end

    it "can be deleted after creation" do
        like = Like.create!(post: post, user: user)
        expect(like.destroy).to be_instance_of(Like)
    end
end
