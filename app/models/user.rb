class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy

    def posts
        return Post.where(user_id: self.id)
    end
end
