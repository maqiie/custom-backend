class Task < ApplicationRecord
      belongs_to :user
    #  belongs_to :category
    # has_many :reminders
  
    attribute :title, :string
  end
  
