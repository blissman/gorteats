class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :owner, class_name: 'User'

  def available? (reservation)
    exists = reservation.id ? true : false

    if exists
      (reservation.party_size != 0) && (reservation.party_size <= capacity - reservations.sum(:party_size) + Reservation.find(reservation.id).party_size)
    else
      (reservation.party_size != 0) && (reservation.party_size <= capacity - reservations.sum(:party_size))
    end
  end
end
