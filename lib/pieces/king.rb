# frozen_string_literal: true

require_relative '../internal/coordinates_shift'

# class King
class King < Piece
  def get_piece_moves # rubocop:disable Naming/AccessorMethodName
    result = []
    (-1..1).each do |file|
      (-1..1).each do |rank|
        next if file.zero? && rank.zero?

        result.push(CoordinatesShift.new(file, rank))
      end
    end
    result
  end

  def square_available_for_move?(coordinates, board)
    result = super(coordinates, board)
    return !board.square_attacked(coordinates, opposite_color) if result

    false
  end
end
