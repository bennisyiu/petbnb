class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :user, uniqueness: { scope: :pet }
  validates :start_date, :end_date, presence: true
end
