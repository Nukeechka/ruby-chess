# frozen_string_literal: true

require_relative '../board/board_renderer'
require_relative '../internal/input_coordinates'

# class Game
class Game
  attr_accessor :board

  def initialize(board)
    @board = board
    @renderer = BoardRenderer.new
    @input_coordinates = InputCoordinates.new
  end

  def game_loop # rubocop:disable Metrics/MethodLength
    is_white_to_move = true

    loop do
      @renderer.render(@board, nil)
      if is_white_to_move
        puts 'White to move'
      else
        puts 'Black to move'
      end
      color_to_move = is_white_to_move ? 'white' : 'black'
      move = @input_coordinates.input_move(@board, color_to_move, @renderer)
      board.move_piece(move)
      is_white_to_move = !is_white_to_move
    end
  end
end
