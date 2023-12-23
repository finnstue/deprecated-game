class Question < ApplicationRecord
  # If reusing questions across games
  has_one_attached :image
  has_many :game_questions
  has_many :games, through: :game_questions

  # Validation for question_type
  validates :question_type, presence: true, inclusion: { in: ['type1', 'type2'] }

  # Scopes for easy querying
  scope :type1, -> { where(question_type: 'type1') }
  scope :type2, -> { where(question_type: 'type2') }
end
