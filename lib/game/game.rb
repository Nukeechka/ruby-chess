# frozen_string_literal: true

# class Game
class Game
  attr_accessor :board

  def initialize(board)
    @board = board
    @renderer = BoardRenderer.new
  end

  def game_loop
    is_white_to_move = true

    @renderer.render(@board)
    loop do
      is_white_to_move = !is_white_to_move
    end
  end
end
