require 'rails_helper'

RSpec.describe Image, type: :model do
    let(:image) {Image.new}

    it "needs post id to be created" do
        expect(image.save).to be_falsey
    end

end