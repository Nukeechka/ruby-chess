# frozen_string_literal: true

require_relative '../board/board_renderer'
require_relative '../internal/input_coordinates'
require_relative './game_state'
require_relative './stalemate_game_state_checker'
require_relative './checkmate_game_state_checker'

# class Game
class Game
  attr_accessor :board

  def initialize(board)
    @board = board
    @renderer = BoardRenderer.new
    @input_coordinates = InputCoordinates.new
    @checkers = [StalemateGameStateChecker.new, CheckmateGameStateChecker.new]
  end

  def game_loop # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    is_white_to_move = true

    state = determine_game_state(board, 'white')
    while state == GameState::ONGOING

      @renderer.render(@board, nil)
      puts 'Do you want to save the game? yes/no'
      choice = gets.chomp
      return 'save' if choice == 'yes'

      if is_white_to_move
        puts 'White to move'
      else
        puts 'Black to move'
      end
      color_to_move = is_white_to_move ? 'white' : 'black'
      move = @input_coordinates.input_move(@board, color_to_move, @renderer)
      board.move_piece(move)
      is_white_to_move = !is_white_to_move

      state = determine_game_state(board, is_white_to_move ? 'white' : 'black')
    end
    @renderer.render(@board, nil)
    puts "Game ended with state = #{state}"
  end

  def determine_game_state(board, color)
    @checkers.each do |checker|
      state = checker.check(board, color)
      return state if state != GameState::ONGOING
    end
    GameState::ONGOING
  end
end
