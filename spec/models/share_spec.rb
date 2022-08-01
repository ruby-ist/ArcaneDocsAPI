require 'rails_helper'

RSpec.describe Share, type: :model do
    let(:first_user) { User.create!(session_id: "some@gmail.com") }
    let(:second_user) { User.create!(session_id: "another@gmail.com") }
    let(:post) {Post.create!(user: first_user, title: "Hello")}
    let(:share) { Share.new }

    it "needs two users and post to be created" do
        expect(share.save).to be_falsey
        share.from = first_user
        share.to = second_user
        share.post = post

        expect(share.save).not_to be_falsey
    end

    it "can be deleted" do
        share = Share.create!(post: post, from: first_user, to: second_user)
        expect(share.destroy).to be_instance_of(Share)
    end
end
