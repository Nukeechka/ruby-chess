# frozen_string_literal: true

require_relative '../internal/file_chars'
require_relative '../internal/coordinates'
require_relative './board'
require_relative '../pieces/piece_factory'

# class BoardFactory
class BoardFactory
  def initialize
    @board = Board.new
    @piece_factory = PieceFactory.new
  end

  include FileChars

  def board_from_fen(fen) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    parts = fen.split(' ')
    piece_positioins = parts[0]
    fen_rows = piece_positioins.split('/')
    fen_rows.each_with_index do |row, index|
      rank = 8 - index
      file_index = 1
      row.chars.each_with_index do |fen_char, _index|
        if digit?(fen_char)
          file_index += fen_char.to_i
        else
          coordinates = Coordinates.new(file_index, rank)
          @board.set_piece(coordinates, @piece_factory.from_fen_char(fen_char, coordinates))
          file_index += 1
        end
      end
    end
    @board
  end

  def digit?(value)
    value.to_i.to_s == value
  end
end
