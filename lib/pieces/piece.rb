# frozen_string_literal: true

# class Piece
class Piece
  attr_reader :color
  attr_accessor :coordinates

  def initialize(color, coordinates)
    @color = color
    @coordinates = coordinates
  end
end
