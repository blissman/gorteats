class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :party_size, numericality: { only_integer: true }
  validates :party_size, :date_time, presence: true

end
