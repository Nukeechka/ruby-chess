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

  def opposite_color
    return 'black' if color == 'white'

    'white'
  end

  def get_piece_moves # rubocop:disable Naming/AccessorMethodName
    p 'Abstract method'
  end

  def get_piece_attacks # rubocop:disable Naming/AccessorMethodName
    get_piece_moves
  end

  def get_attacked_squares(board)
    result = []
    get_piece_attacks.each do |shift|
      next unless @coordinates.can_shift?(shift)

      new_coordinates = @coordinates.shift(shift)
      result.push(new_coordinates) if square_available_for_attack?(new_coordinates, board)
    end
    result
  end

  def square_available_for_attack?(_coordinates, _board)
    true
  end
end
