class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, 'La date choisie doit être ultérieure à la date de début')
    end
  end
end
