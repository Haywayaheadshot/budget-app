class Group < ApplicationRecord
  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  has_one_attached :icon

  after_initialize :set_default_icon, if: :new_record?

  def set_default_icon
    return if icon.attached?

    icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar-icon.png')),
                filename: 'avatar-icon.png', content_type: 'image/png')
  end
end
