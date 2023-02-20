class Group < ApplicationRecord
    has_many :entities
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
