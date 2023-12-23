class Vote < ApplicationRecord
  belongs_to :round
  belongs_to :player
  belongs_to :answer
end
