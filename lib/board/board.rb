# frozen_string_literal: true

require_relative '../internal/coordinates'
require_relative '../pieces/pawn'

# class Board
class Board
  attr_reader :pieces

  def initialize
    # @pieces = Array.new(8) { Array.new(8, '*') }
    @pieces = {}
  end

  def set_piece(coordinates, piece)
    piece.coordinates = coordinates
    @pieces[coordinates] = piece
  end

  def set_default_pieces_position
    (1..8).reverse_each do |file|
      set_piece(Coordinates.new(file, 7), Pawn.new('black', Coordinates.new(file, 7)))
      set_piece(Coordinates.new(file, 2), Pawn.new('white', Coordinates.new(file, 2)))
    end
  end

  def square_empty?(coordinates)
    !@pieces.include?(coordinates)
  end

  def get_piece(coordinates)
    @pieces.fetch(coordinates)
  end

  def self.square_dark?(coordinates)
    (((coordinates.rank + 1) + coordinates.file) % 2).zero?
  end
end
