# frozen_string_literal: true

# class Piece
class Piece
  attr_reader :color
  attr_accessor :coordinates

  def initialize(color, coordinates)
    @color = color
    @coordinates = coordinates
  end

  def get_available_move_squares(board)
    result = []
    get_piece_moves.each do |shift|
      next unless @coordinates.can_shift?(shift)

      new_coordinates = @coordinates.shift(shift)
      result.push(new_coordinates) if square_available_for_move?(new_coordinates, board)
    end
    result
  end

  def square_available_for_move?(coordinates, board)
    board.square_empty?(coordinates) || board.get_piece(coordinates).color != @color
  end

  def get_piece_moves; end
end
