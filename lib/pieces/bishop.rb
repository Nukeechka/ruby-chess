# frozen_string_literal: true

require_relative '../internal/coordinates_shift'
require_relative '../internal/board_utils'

# class Bishop
class Bishop < Piece
  include BoardUtils
  def get_piece_moves # rubocop:disable Naming/AccessorMethodName
    result = []
    (-7..7).each do |i|
      next if i.zero?

      result.push(CoordinatesShift.new(i, i))

      next if i.zero?

      result.push(CoordinatesShift.new(i, -i))
    end
    result
  end

  def square_available_for_move?(coordinates, board)
    result = super(coordinates, board)
    if result
      coordinates_between = diagonal_coordinates_between(@coordinates, coordinates)
      coordinates_between.each do |coordinate|
        return false unless board.square_empty?(coordinate)
      end
    elsif !result
      return false
    end
    true
  end
end
