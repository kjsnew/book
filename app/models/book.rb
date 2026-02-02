class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality:
    { greater_than_or_equal_to: 0 }
  validates :publish_date, presence: true
  # validate :must_be_valid_date

  # private

  # def must_be_valid_date
  #   return if publish_date.blank? # blank date
  #   Date.parse(publish_date.to_s)
  # rescue ArgumentError
  #   errors.add(:publish_date, "must be a valid date")
  # end
end
