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
      source_coordinates = @input_coordinates.input_piece_coordinates_for_color(is_white_to_move ? 'white' : 'black',
                                                                                board)
      piece = board.get_piece(source_coordinates)
      @renderer.render(@board, piece)
      available_squares = piece.get_available_move_squares(board)
      target_coordinates = @input_coordinates.input_available_square(available_squares)
      board.move_piece(source_coordinates, target_coordinates)
      is_white_to_move = !is_white_to_move
    end
  end
end
