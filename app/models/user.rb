class User < ActiveRecord::Base

  has_secure_password

  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :businesses, class_name: 'Restaurant', foreign_key: :owner_id


end
