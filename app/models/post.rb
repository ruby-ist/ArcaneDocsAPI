class Post < ApplicationRecord
    has_many :images
    has_many :likes

    belongs_to :user
end
