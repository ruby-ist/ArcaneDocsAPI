class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_many :shared_posts, class_name: 'Share', foreign_key: 'from_id', dependent: :destroy
    has_many :received_posts, class_name: 'Share', foreign_key: 'to_id', dependent: :destroy
end
