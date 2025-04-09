# frozen_string_literal: true

require_relative '../internal/board_utils'
require_relative '../internal/coordinates_shift'

# class Queen
class Queen < Piece
  include BoardUtils
  def get_piece_moves # rubocop:disable Naming/AccessorMethodName
    result = []
    (-7..7).each do |i|
      next if i.zero?

      result.push(CoordinatesShift.new(i, 0))
      result.push(CoordinatesShift.new(i, i))

      next if i.zero?

      result.push(CoordinatesShift.new(0, i))
      result.push(CoordinatesShift.new(i, -i))
    end
    result
  end

  def square_available_for_move?(coordinates, board)
    result = super(coordinates, board)
    if result
      square_available_for_attack?(coordinates, board)
    elsif !result
      false
    end
  end

  def square_available_for_attack?(coordinates, board) # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
    result = super(coordinates, board)
    if result
      coordinates_between = if @coordinates.file == coordinates.file
                              vertical_coordinates_between(@coordinates, coordinates)
                            elsif @coordinates.rank == coordinates.rank
                              horizontal_coordinates_between(@coordinates, coordinates)
                            else
                              diagonal_coordinates_between(@coordinates, coordinates)
                            end

      coordinates_between.each do |coordinate|
        return false unless board.square_empty?(coordinate)
      end
    elsif !result
      false
    end
  end
end
