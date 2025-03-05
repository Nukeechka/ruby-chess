# frozen_string_literal: true

require_relative '../internal/coordinates'

# class Board
class Board
  attr_reader :pieces

  def initialize
    # @pieces = Array.new(8) { Array.new(8, '*') }
    @pieces = {}
  end

  def set_piece(piece, coordinates)
    piece.coordinates = coordinates
    @pieces[coordinates] = piece
  end

  def self.square_dark?(coordinates)
    (((coordinates.rank + 1) + coordinates.file) % 2).zero?
  end
end
