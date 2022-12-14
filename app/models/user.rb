class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: {maximum: 50}
    validates :email, {presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                uniqueness: { case_sensitive: false }}
    has_secure_password
    validates :password, length: {minimum: 6, maximum: 40},
                format: { with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/i },
                unless: -> { validation_context == :hoge }
    has_many :tasks
end
