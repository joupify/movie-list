class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  mount_uploader :photo, ImageUploader
  has_one_attached :photo

end
