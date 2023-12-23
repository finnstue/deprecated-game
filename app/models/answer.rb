class Answer < ApplicationRecord
  belongs_to :player
  belongs_to :question
end
