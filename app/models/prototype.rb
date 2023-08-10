class Prototype < ApplicationRecord
  validates :prototype_name, presence: true
  validates :copy,           presence: true
  validates :concept,        presence: true
  validates :image,          presence: true

  belongs_to :user
  has_many :comments
  has_one_attached :image
end 