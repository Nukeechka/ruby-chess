# frozen_string_literal: true

require_relative './file_chars'
require_relative './coordinates'
require_relative './move'

# class InputCoordinates
class InputCoordinates
  include FileChars

  def input # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    loop do
      puts 'Please enter coordinates (ex. a1)'
      line = gets.chomp

      if line.length != 2
        puts 'Invalid format'
        next
      end

      file_char = line.chars[0].downcase
      rank_char = line.chars[1].to_i

      unless FileChars::FILE_CHARS.include?(file_char)
        puts 'Invalid format'
        next
      end

      if rank_char <= 0 || rank_char > 8
        puts 'Invalid format'
        next
      end

      formatted_file = file_from_char(file_char)

      return Coordinates.new(formatted_file, rank_char)
    end
  end

  def input_piece_coordinates_for_color(color, board) # rubocop:disable Metrics/MethodLength
    loop do
      puts 'Enter coordinates for a piece to move'
      coordinates = input

      if board.square_empty?(coordinates)
        puts 'Empty square'
        next
      end

      piece = board.get_piece(coordinates)
      if piece.color != color
        puts 'Wrong color'
        next
      end

      available_move_squares = piece.get_available_move_squares(board)
      if available_move_squares.empty?
        puts 'Blocked piece'
        next
      end

      return coordinates
    end
  end

  def input_available_square(available_squares)
    loop do
      puts 'Enter your move for selected piece'
      coordinates = input
      unless available_squares.include?(coordinates)
        puts 'Non-available square to move'
        next
      end
      return coordinates
    end
  end

  def input_move(board, color, renderer)
    source_coordinates = input_piece_coordinates_for_color(color, board)
    piece = board.get_piece(source_coordinates)
    renderer.render(board, piece)
    available_squares = piece.get_available_move_squares(board)
    target_coordinates = input_available_square(available_squares)
    Move.new(source_coordinates, target_coordinates)
  end
end
