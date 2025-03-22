# frozen_string_literal: true

require_relative '../internal/coordinates'
require_relative '../internal/colors'
require_relative './board'
require_relative '../pieces/piece'

# class BoardRenderer
class BoardRenderer
  include AnsiColors
  def render(board, piece_to_move) # rubocop:disable Metrics/MethodLength
    available_move_squares = if !piece_to_move.nil?

                               piece_to_move.get_available_move_squares(board)
                             else
                               []
                             end
    (1..8).reverse_each do |rank|
      line = ''
      (1..8).each do |file|
        coordinates = Coordinates.new(file, rank)
        is_highlight = available_move_squares.include?(coordinates)

        line += if board.square_empty?(coordinates)
                  sprite_for_empty_square(coordinates, is_highlight)
                else
                  sprite_for_piece(board.get_piece(coordinates), is_highlight)
                end
      end
      line += AnsiColors::RESET
      puts line
    end
  end

  private

  def colorize_sprite(sprite, piece_color, square_dark, is_highlighted) # rubocop:disable Metrics/MethodLength
    result = sprite
    result = if piece_color == 'white'
               AnsiColors::WHITE_PIECE + result
             else
               AnsiColors::BLACK_PIECE + result
             end

    if is_highlighted
      AnsiColors::HIGHLIGHTED_SQUARE + result
    elsif square_dark
      AnsiColors::BLACK_SQUARE + result
    else
      AnsiColors::WHITE_SQUARE + result
    end
  end

  def sprite_for_empty_square(coordinates, is_highlight)
    colorize_sprite('   ', 'white', Board.square_dark?(coordinates), is_highlight)
  end

  def select_sprite_for_piece(piece)
    pieces_list = {
      'Pawn' => '♙',
      'Knight' => '♘',
      'Rook' => '♖',
      'Bishop' => '♗',
      'Queen' => '♕',
      'King' => '♔'
    }
    return pieces_list[piece.class.name] if pieces_list.include?(piece.class.name)

    ''
  end

  def sprite_for_piece(piece, is_highlight)
    colorize_sprite(" #{select_sprite_for_piece(piece)} ", piece.color, Board.square_dark?(piece.coordinates),
                    is_highlight)
  end
end
