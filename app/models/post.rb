class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum:5, maximum:40 }
    validates :body, presence: true, length: { minimum:10, maximum:1500 }
    belongs_to :user, foreign_key: 'user_id'
    has_many :comments

    def self.search(search)  
        where("lower(users.username) LIKE :search OR lower(posts.title) LIKE :search", search: "%#{search.downcase}%")
    end
end
