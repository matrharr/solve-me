class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email

  has_one :questionaire

  has_many :questionaire_takers, through: :taker_matches, source: :questionaire_taker
  has_many :taker_matches, foreign_key: :questionaire_maker_id, class_name: "Match"

  has_many :questionaire_makers, through: :maker_matches, source: :questionaire_maker
  has_many :maker_matches, foreign_key: :questionaire_taker_id, class_name: "Match"

  has_secure_password

end
