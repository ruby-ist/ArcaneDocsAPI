class Post < ApplicationRecord
    validates :title, length: {minimum: 3}

    has_many :images, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :shares, dependent: :destroy

    belongs_to :user
end
