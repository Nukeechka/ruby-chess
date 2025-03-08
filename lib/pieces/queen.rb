# frozen_string_literal: true

# class Queen
class Queen
  attr_reader :color
  attr_accessor :coordinates

  def initialize(color, coordinates)
    @color = color
    @coordinates = coordinates
  end
end
