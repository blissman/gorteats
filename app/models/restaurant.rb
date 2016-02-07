class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :owner, class_name: 'User'

  def available? (reservation)
    current_reso_party_size = reservation.id ? Reservation.find(reservation.id).party_size : 0

    availability = reservation.party_size <= capacity - reservations.sum(:party_size) + current_reso_party_size

    reservation.party_size != 0 && availability

  end

end
