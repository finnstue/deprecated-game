class Player < ApplicationRecord
  belongs_to :game, optional: true
  has_many :answers
end
