# frozen_string_literal: true

require_relative '../internal/board_utils'
require_relative './piece'

# class Pawn
class Pawn < Piece
  include BoardUtils
  def get_piece_moves # rubocop:disable Naming/AccessorMethodName, Metrics/AbcSize, Metrics/MethodLength
    result = []
    if @color == 'white'
      result.push(CoordinatesShift.new(0, 2)) if @coordinates.rank == 2
      result.push(CoordinatesShift.new(0, 1))
      result.push(CoordinatesShift.new(1, 1))
      result.push(CoordinatesShift.new(-1, 1))
    else
      result.push(CoordinatesShift.new(0, -2)) if @coordinates.rank == 7
      result.push(CoordinatesShift.new(0, -1))
      result.push(CoordinatesShift.new(1, -1))
      result.push(CoordinatesShift.new(-1, -1))
    end
  end

  def get_attack_move_squares
    result = []
    get_piece_attacks.each do |shift|
      next unless @coordinates.can_shift?(shift)

      new_coordinates = @coordinates.shift(shift)
      result.push(new_coordinates)
    end
    result
  end

  def get_piece_attacks # rubocop:disable Naming/AccessorMethodName
    result = []
    if @color == 'white'
      result.push(CoordinatesShift.new(1, 1))
      result.push(CoordinatesShift.new(-1, 1))
    else
      result.push(CoordinatesShift.new(1, -1))
      result.push(CoordinatesShift.new(-1, -1))
    end
  end

  def square_available_for_move?(coordinates, board)
    if @coordinates.file == coordinates.file
      return board.square_empty?(coordinates) if (coordinates.rank - @coordinates.rank).abs == 1

      coordinates_between = vertical_coordinates_between(@coordinates, coordinates)
      coordinates_between.each do |coordinate|
        return false unless board.square_empty?(coordinate)
      end

    else
      return false if board.square_empty?(coordinates)

      true if board.get_piece(coordinates).color != @color

    end
  end
end
