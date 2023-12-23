class GamesController < ApplicationController

  # Action to create a new game
  def create
    if params[:join_game]
      render action: :join and return
    end
    # Generate a random code for the new game
    unique_code = SecureRandom.hex(4) # Generates an 8-character hex code

    # Create a new game with the generated code
    game = Game.new(code: unique_code, status: Game::STATUS_WAITING)
    Rails.logger.debug "After creation, game status: #{game.status}"

    if game.save
      Rails.logger.debug "Created game with code: #{game.code}"

      # Redirect to the game page or return a success response
      # You might also want to show the generated code to the user

      # Redirect to the lobby for the created game
      redirect_to game_lobby_path(game)
    else
      # Handle errors, such as if the game fails to save
      Rails.logger.debug "Failed to save game: #{game.errors.full_messages}"
    end
  end

  def play
    @game = Game.find(params[:id])
    @game_questions = Question.order("RANDOM()")
    @question_index = params[:question_index] || 1  # Get the question_index from the parameters
    # Other necessary code for the play action
  end

  # Action for players to join a game
  def join
    # Retrieve the game code directly from the request parameters
    code = params[:code]

    # Find the game by its unique code
    game = Game.find_by(code: code)
    Rails.logger.debug "After joining, game status: #{game.status}"

    if game
      Rails.logger.debug "Joining game with code: #{code}"
      # Logic to add the player to the game
      # This might involve updating a PlayerGame association or similar
      redirect_to game_lobby_path(game), notice: "You've joined the game!"
    else
      # Handle the case where no game is found with the given code
      redirect_to join_game_path, alert: "Game not found. Please check the game code."
    end
  end

  def lobby
    @game = Game.find(params[:id])
    # Here you can also retrieve and display information about the game,
    # such as current players, game status, etc.
  end

  def submit_answer
    # Get the current round and player
    round = Round.find(params[:round_id])
    player = Player.find(params[:player_id])

    # Create a new answer associated with the current round and player
    answer = round.answers.create(content: params[:content], player: player)

    if answer.save
      # Increment the question index
      @question_index = params[:question_index].to_i + 1
  
      # Fetch the next question
      @next_question = @game_questions[@question_index - 1]
  
      # Redirect to the game play view with the next question
      redirect_to game_play_path(@game, question_index: @question_index)
    else
      # Handle unsuccessful save, e.g. show error message
    end
  end

  def start
    @game = Game.find(params[:id])
    Rails.logger.debug "Starting game with id: #{@game.id}, current status: #{@game.status}"

    if @game.status == Game::STATUS_WAITING && @game.update(status: Game::STATUS_STARTED)
      
      # Select a set of random questions for the game
      # Broadcast a message to all players that the game has started, along with the selected questions
      @game_questions = Question.order("RANDOM()").limit(3).as_json
      ActionCable.server.broadcast("Quiplash", { game_started: true, game_id: @game.id, questions: @game_questions }, coder: ActiveSupport::JSON)
      redirect_to game_play_path(@game)
    else
      # Handle errors, like not being able to start the game
      redirect_to game_lobby_path(@game), alert: "Game could not be started."
    end
  end

  # Add a new action in the GamesController to fetch the next question for the game round
  def next_question
    @game_questions = Question.order("RANDOM()").limit(3)
    @next_question = @game_questions[params[:index].to_i - 1]
    render json: { question: @next_question.content }
  end
end
