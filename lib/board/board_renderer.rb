# frozen_string_literal: true

require 'rainbow'
require_relative '../internal/coordinates'
require_relative './board'

# class BoardRenderer
class BoardRenderer
  def render(_board)
    (1..8).reverse_each do |rank|
      line = ''
      (1..8).each do |file|
        line += sprite_for_empty_square(Coordinates.new(file, rank))
      end
      puts line
    end
  end

  def colorize_sprite(_sprite, piece_color, square_dark) # rubocop:disable Metrics/MethodLength
    result = '   '
    result = if piece_color == 'white'
               Rainbow(result).white
             else
               Rainbow(result).black
             end

    if square_dark
      Rainbow(result).bg(:black)
    else
      Rainbow(result).bg(:white)
    end
  end

  def sprite_for_empty_square(coordinates)
    colorize_sprite('', 'white', Board.square_dark?(coordinates))
  end
end
