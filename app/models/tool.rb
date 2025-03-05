class Tool < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :localisation, presence: true
  validates :photo, presence: true

  has_one_attached :photo
end
