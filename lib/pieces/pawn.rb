# frozen_string_literal: true

require_relative './piece'

# class Pawn
class Pawn < Piece
  def initialize
    super(color, coordinates)
  end
end
