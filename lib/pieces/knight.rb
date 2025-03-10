# frozen_string_literal: true

require_relative '../internal/coordinates_shift'

# class Knight
class Knight < Piece
  def get_piece_moves # rubocop:disable Naming/AccessorMethodName
    [
      CoordinatesShift.new(1, 2),
      CoordinatesShift.new(2, 1),

      CoordinatesShift.new(1, -2),
      CoordinatesShift.new(2, -1),

      CoordinatesShift.new(-2, 1),
      CoordinatesShift.new(-1, 2),

      CoordinatesShift.new(-2, -1),
      CoordinatesShift.new(-1, -2)
    ]
  end
end
