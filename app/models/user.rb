class User < ApplicationRecord
    has_many :posts
    has_many :likes

    has_many :shared_posts, class_name: 'Share', foreign_key: 'from_id'
    has_many :received_posts, class_name: 'Share', foreign_key: 'to_id'
end
