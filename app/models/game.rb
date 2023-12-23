class Game < ApplicationRecord
  has_many :players
  has_many :game_questions
  has_many :questions, through: :game_questions
  STATUS_WAITING = 'waiting'.freeze
  STATUS_STARTED = 'started'.freeze
  has_many :rounds  # Add this line to establish the association with rounds
  
  def next_round
    # Implement the logic to progress to the next round
  end
end