# frozen_string_literal: true

require_relative './lib/game/game'
require_relative './lib/board/board_factory'
require_relative './lib/board/board_renderer'

board_factory = BoardFactory.new
board = board_factory.board_from_fen('1b6/8/3n2r1/1B6/3Q1q2/8/1N3R2/8 w - - 0 1')
game = Game.new(board)
game.game_loop
