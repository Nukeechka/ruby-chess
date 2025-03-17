# frozen_string_literal: true

require_relative './lib/board/board'
require_relative './lib/game/game'

board = Board.new
board.set_default_pieces_position
game = Game.new(board)
game.game_loop
