# frozen_string_literal: true

require_relative './lib/game/game'
require_relative './lib/board/board_factory'
require_relative './lib/board/board_renderer'

board_factory = BoardFactory.new
board = board_factory.board_from_fen('3k4/8/8/b7/8/8/2PK4/6N1 w - - 0 1')
game = Game.new(board)
game.game_loop
