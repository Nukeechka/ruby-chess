# frozen_string_literal: true

require_relative '../internal/coordinates'
require_relative '../pieces/pawn'
require_relative '../pieces/rook'
require_relative '../pieces/knight'
require_relative '../pieces/bishop'
require_relative '../pieces/queen'
require_relative '../pieces/king'

# class Board
class Board
  attr_reader :pieces

  def initialize
    @pieces = {}
  end

  def set_piece(coordinates, piece)
    piece.coordinates = coordinates
    @pieces[coordinates] = piece
  end

  def remove_piece(coordinates)
    @pieces.delete(coordinates)
  end

  def move_piece(move)
    piece = get_piece(move.from)
    remove_piece(move.from)
    set_piece(move.to, piece)
  end

  def set_default_pieces_position # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    # set Pawns
    (1..8).reverse_each do |file|
      set_piece(Coordinates.new(file, 7), Pawn.new('black', Coordinates.new(file, 7)))
      set_piece(Coordinates.new(file, 2), Pawn.new('white', Coordinates.new(file, 2)))
    end

    # set Rooks
    set_piece(Coordinates.new(1, 8), Rook.new('black', Coordinates.new(1, 8)))
    set_piece(Coordinates.new(8, 8), Rook.new('black', Coordinates.new(8, 8)))
    set_piece(Coordinates.new(1, 1), Rook.new('white', Coordinates.new(1, 1)))
    set_piece(Coordinates.new(8, 1), Rook.new('white', Coordinates.new(8, 1)))

    # set Knights
    set_piece(Coordinates.new(2, 8), Knight.new('black', Coordinates.new(2, 8)))
    set_piece(Coordinates.new(7, 8), Knight.new('black', Coordinates.new(7, 8)))
    set_piece(Coordinates.new(2, 1), Knight.new('white', Coordinates.new(2, 1)))
    set_piece(Coordinates.new(7, 1), Knight.new('white', Coordinates.new(7, 1)))

    # set Bishops
    set_piece(Coordinates.new(6, 1), Bishop.new('white', Coordinates.new(6, 1)))
    set_piece(Coordinates.new(3, 1), Bishop.new('white', Coordinates.new(3, 1)))
    set_piece(Coordinates.new(6, 8), Bishop.new('black', Coordinates.new(6, 8)))
    set_piece(Coordinates.new(3, 8), Bishop.new('black', Coordinates.new(3, 8)))

    # set Queens
    set_piece(Coordinates.new(4, 8), Queen.new('black', Coordinates.new(4, 8)))
    set_piece(Coordinates.new(4, 1), Queen.new('white', Coordinates.new(4, 1)))

    # set Kings
    set_piece(Coordinates.new(5, 8), King.new('black', Coordinates.new(5, 8)))
    set_piece(Coordinates.new(5, 1), King.new('white', Coordinates.new(5, 1)))
  end

  def square_empty?(coordinates)
    !@pieces.include?(coordinates)
  end

  def get_piece(coordinates)
    @pieces.fetch(coordinates)
  end

  def get_pieces_by_color(color)
    result = []
    @pieces.each_value do |piece|
      result.push(piece) if piece.color == color
    end
    result
  end

  def self.square_dark?(coordinates)
    (((coordinates.rank + 1) + coordinates.file) % 2).zero?
  end

  def square_attacked(coordinates, color)
    squares_attacked = []
    opposite_pieces = get_pieces_by_color(color)
    opposite_pieces.each do |piece|
      if piece.instance_of? Pawn
        squares_attacked.concat(piece.get_attack_move_squares)
      else
        squares_attacked.concat(piece.get_available_move_squares(self))
      end
    end
    squares_attacked.include?(coordinates)
  end
end
