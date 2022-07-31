class Share < ApplicationRecord
    belongs_to :shared_user, class_name: 'User'
    belongs_to :received_user, class_name: 'User'

    belongs_to :post
end
