class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :review_images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_attachments_for :review_images, attachment: :review_image
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  enum use_time: { morning:1,evening:2,night:3 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :title, presence: true
end
