class Image < ApplicationRecord
    validates :image_url, presence: true
    belongs_to :post
end
