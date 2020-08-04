class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :gender, inclusion: { in: ['Male', 'Female'] }
  validates :description, length: { minimum: 10 }
  validates :name, :breed, :price, :age, :description, presence: true
end
