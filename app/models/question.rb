class Question < ApplicationRecord
  belongs_to :questionaire
  has_many :answers
end
