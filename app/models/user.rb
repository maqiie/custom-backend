class User < ApplicationRecord
    has_many :tasks
    has_many :categories
    has_secure_password
    attribute :name, :string
end
