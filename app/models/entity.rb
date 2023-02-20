class Entity < ApplicationRecord
    has_many :groups
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
