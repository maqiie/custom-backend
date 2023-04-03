
class User < ApplicationRecord
    has_many :tasks
    has_many :categories
    has_secure_password
    attribute :name, :string
    
    def authenticate(password)
        if self && self.password_digest.present? && BCrypt::Password.new(self.password_digest) == password
          self
        else
          nil
        end
      end
      
  end
  