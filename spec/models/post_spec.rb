require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:user) { User.create!(session_id: "some@gmail.com") }
    let(:post) { Post.new(title: "hello") }

    it "requires user to be created" do
        expect(post.save).to be_falsey
        post.user = user
        expect(post.save).not_to be_falsey
    end

    it "can have likes" do
        expect(post.likes).not_to be_nil
    end

    it "has an associated images" do
        expect(post.images).not_to be_nil
    end

    it "has a shared users data" do
        expect(post.shares).not_to be_nil
    end

    it "can be deleted with its images" do
        post.user = user
        post.images << Image.new(image_url: "Jpic.jpg")
        post.save

        expect(Image.all).not_to be_empty

        post.destroy
        expect(Image.all).to be_empty
    end

    it "can be deleted with its shares" do
        post.user = user
        post.save

        another_user = User.create!(session_id: "another@gmail.com")
        share = Share.create!(post: post, from: user, to: another_user)

        expect(Share.all).not_to be_empty

        post.destroy
        expect(Share.all).to be_empty
    end
end
