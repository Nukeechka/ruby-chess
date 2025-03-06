# frozen_string_literal: true

require_relative '../internal/coordinates'
require_relative '../internal/colors'
require_relative './board'

# class BoardRenderer
class BoardRenderer
  include AnsiColors
  def render(board) # rubocop:disable Metrics/MethodLength
    (1..8).reverse_each do |rank|
      line = ''
      (1..8).each do |file|
        coordinates = Coordinates.new(file, rank)
        line += if board.square_empty?(coordinates)
                  sprite_for_empty_square(coordinates)
                else
                  sprite_for_piece(board.get_piece(coordinates))
                end
      end
      line += AnsiColors::RESET
      puts line
    end
  end

  def colorize_sprite(sprite, piece_color, square_dark) # rubocop:disable Metrics/MethodLength
    result = sprite
    result = if piece_color == 'white'
               AnsiColors::WHITE_PIECE + result
             else
               AnsiColors::BLACK_PIECE + result
             end

    if square_dark
      AnsiColors::BLACK_SQUARE + result
    else
      AnsiColors::WHITE_SQUARE + result
    end
  end

  def sprite_for_empty_square(coordinates)
    colorize_sprite('   ', 'white', Board.square_dark?(coordinates))
  end

  def sprite_for_piece(piece)
    colorize_sprite(' A ', piece.color, Board.square_dark?(piece.coordinates))
  end
end
