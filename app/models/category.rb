class Category < ApplicationRecord
    belongs_to :post
    # validates :name, presence: true
    # validates :post_id, presence: true

end
