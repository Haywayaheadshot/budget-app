class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entities
  has_many :groups

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_one_attached :photo

  after_initialize :set_default_photo, if: :new_record?

  def set_default_photo
    unless photo.attached?
      photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar-icon.png')), filename: 'avatar-icon.png', content_type: 'image/png')
    end
  end
end
