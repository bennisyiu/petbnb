class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :pets, source: :bookings
end
