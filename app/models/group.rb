class Group < ApplicationRecord
  has_many :group_entities
  has_many :entities, through: :group_entities
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
