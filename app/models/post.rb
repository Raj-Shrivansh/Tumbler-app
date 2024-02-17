class Post < ApplicationRecord
    has_many: comments
    validates :title,presence: true,length: {minimum: 5}
    validates :content,presence: true, length: {minimum: 1550}
end
