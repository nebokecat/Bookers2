class PostBook < ApplicationRecord
    belongs_to :user
    validates :book_name, presence: true
    validates :book_comment, presence: true, length: { maximum: 200 } 
end
