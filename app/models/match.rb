class Match < ApplicationRecord

  belongs_to :questionaire_maker, foreign_key: "questionaire_maker_id", class_name: "User"

  belongs_to :questionaire_taker, foreign_key: "questionaire_taker_id", class_name: "User"

end
