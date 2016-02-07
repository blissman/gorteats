class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :owner, class_name: 'User'

  # NOTE: This logic is flawed. The controller is too big for the model. The available? method should only expect a datetime and partysize, not the entire reservation object. Need to rewrite controller first, refactor this method and rewrite tests to pass.
  def available?(reservation)
    # current_reso_party_size = reservation.id ? Reservation.find(reservation.id).party_size : 0

    current_capacity = capacity - reservations.sum(:party_size)

    availability = reservation.party_size <= current_capacity # + current_reso_party_size

    reservation.party_size > 0 && availability

  end

end
